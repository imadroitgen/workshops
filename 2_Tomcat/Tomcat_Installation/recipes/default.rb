#
# Cookbook:: Tomcat_Installation
# Recipe:: default
# Author:: Aamer Syed Abdul Basit
# Purpose:: Demonstrate 2_Tomcat Workshop Outcome
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
# Instruction 1 : Install OpenJDK 7 JDK using yum

# Solution to Instruction 1
# Step 1 : Install Java 1.7 using the package resource of Chef. Use the package resource to install the Tomcat installation. (Chef Reference - https://docs.chef.io/resource_package.html)

package 'Install Java 1.7' do
  package_name 'java-1.7.0-openjdk-devel'
  action :install
end

# Instruction 2 : Create a user for Tomcat

# Solution to Instruction 2
# Step 1 : Create a group as per the instructions.md and add the user tomcat to the group. Use the group resource of Chef (Chef Reference -> https://docs.chef.io/resource_group.html)
group 'tomcat' do
  action :create
end  

# Step 2 : Create a user as per the instructions.md. Use the user resource of Chef (Chef Reference -> https://docs.chef.io/resource_user.html)
user 'tomcat' do
  gid 'tomcat'
  home '/opt/tomcat'
  shell '/bin/nologin'
  action :create
end

# Instruction 3 : Download and Extract the Tomcat Binaries, update the permissions post extraction.
# Step 1: Download the latest binaries from the remote server to the VM using the remote_file resource. (Chef Referene - https://docs.chef.io/resource_remote_directory.html)

remote_file '/tmp/apache-tomcat-8.5.31.tar.gz' do
  source 'https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.31/bin/apache-tomcat-8.5.31.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Step 2 : Create a directory /opt/tomcat using the directory resource.
directory '/opt/tomcat' do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end

# Step 3 : Extract the tomcat binary using the execute resource. (Chef Reference -> https://docs.chef.io/resource_execute.html)
execute 'Unpack Tomcat' do
  command 'sudo tar xvf /tmp/apache-tomcat-8.5.31.tar.gz -C /opt/tomcat --strip-components=1'
  action :run 
end


# Step 4 : Update the permissions of the tomcat directories using the execute resource. You can alternatively use Bash resource as well however that is not platform agnostic and needs Bash to be installed on the OS. Execute resource offers compatibility across multiple unix systems as it can determine what shell needs to be run (Chef Reference -> https://docs.chef.io/resource_execute.html) 

execute 'Update the Tomcat Permissions' do
 command <<-EOH
 sudo chgrp -R tomcat /opt/tomcat
 cd /opt/tomcat
 sudo chmod -R g+r conf
 sudo chmod g+x conf
 sudo chown -R tomcat webapps/ work/ temp/ logs/
 EOH
end

# Instruction 4 : Install the Systemd Unit File
# Step 1 : The tomcat.service file can be loaded using the Template resource. You can use file resource alternatively but Template resource can be reused across recipes and increases modularity. (Chef Reference -> https://docs.chef.io/resource_template.html)

template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


