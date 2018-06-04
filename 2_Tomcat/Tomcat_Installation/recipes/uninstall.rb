#
# Cookbook:: Tomcat_Installation
# Recipe:: uninstall
#
# Copyright:: 2018, The Authors, All Rights Reserved.
# This recipe cleans up the installations performed as part of the Tomcat Installation Default recipe

# Remove the OpenJDK

package 'Install Java 1.7' do
  package_name 'java-1.7.0-openjdk-devel'
  action :remove
end


# Stop the tomcat service
service 'tomcat.service' do
  action [ :disable, :stop ]
end

# Remove the template/file tomcat.service
template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :delete
end

# Clean up the directories
directory '/opt/tomcat' do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  recursive true
  action :delete
end

# Delete the tomcat user
user 'tomcat' do
  gid 'tomcat'
  home '/opt/tomcat'
  shell '/bin/nologin'
  action :remove
end

# Delete the tomcat group
group 'tomcat' do
  action :remove
end
