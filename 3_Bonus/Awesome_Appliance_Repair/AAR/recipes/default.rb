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
