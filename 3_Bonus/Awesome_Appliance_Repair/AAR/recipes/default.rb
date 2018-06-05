#
# Cookbook:: AAR
# Recipe:: default
# Author : Aamer Syed Abdul Basit
# Purpose : Workshop for Awesome Appliance Repair Application
# Copyright:: 2018, The Authors, All Rights Reserved.

# Instruction 1 : apache2, mysql and unzip needs to be installed as pre-requisites.Additionally python specific packages also need to be installed. We can use a whitespace array to install all packages at once. (Chef Reference -> https://docs.chef.io/resource_examples.html#package)

%w{apache2 mysql-server unzip libapache2-mod-wsgi python-pip python-mysqldb}.each do |pkg|
 package pkg do
  action :install
 end
end

# Instruction 2 : Install Flask using the execute resource.
execute 'Install Flask' do
  command 'pip install flask'
  action :run
not_if { ::File.exist?('/usr/local/bin/flask') }
end

# Instruction 3 : Download the remote file using the remote_file resource.
remote_file '/tmp/master.zip' do
  source 'https://github.com/colincam/Awesome-Appliance-Repair/archive/master.zip'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
not_if { ::File.exist?('/tmp/Awesome-Appliance-Repair-master/AAR') }
end

# Instruction 4 : Unzip the file and move the AAR to /var/www
execute 'Unzip the downloaded files' do
  command <<-EOF
    unzip -u /tmp/master.zip -d /tmp
    sudo mv /tmp/Awesome-Appliance-Repair-master/AAR /var/www
  EOF
  action :run
not_if { ::File.exist?('/var/www/AAR/') }
end

# Instruction 5 - Modify the owner and group for the /var/www/AAR dirctory 
directory '/var/www/AAR' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

# Instruction 6 - Create the AAR_config file
file '/var/www/AAR/AAR_config.py' do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

# Instruction 7 - Create and populate apache.conf file
# Populate the apache config file
template '/etc/apache2/sites-enabled/AAR-apache.conf' do
  source 'apache_conf.erb'
  action :create
end


