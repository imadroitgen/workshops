#
# Cookbook:: MongoDB_Installation
# Recipe:: default
# Author:: Aamer Syed Abdul Basit
# Purpose:: Demonstrate 1_MongoDB Workshop Outcome
# Copyright:: 2018, The Authors, All Rights Reserved.

# Instruction 1 : Create a /etc/yum.repos.d/mongodb.repo file to hold the following configuration information for the MongoDB repository

# Solution to Instruction 1
# Step 1 : Create a /etc/yum.repos.d folder if it doesn't already exist. Use the directory resource to create the folder (Chef Reference - https://docs.chef.io/resource_directory.html)

directory '/etc/yum.repos.d/' do
 owner 'root'
 group 'root'
 mode '0755'
 action :create
end

# Step 2 : Create a mongodb.repo file to hold the MongoDB configuration Information. As per docs.mongodb.com the file should be mongodb-org-3.6.repo. Best practice is to use templates for dynamic generation of static text files. (Chef Reference - https://docs.chef.io/resource_template.html)

template '/etc/yum.repos.d/mongodb-org-3.6.repo' do
  source 'mongodb_repo.erb'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


# Instruction 2 : Install the MongoDB packages and associated tools
# Solution to Instruction 2
# Step 1 : Run the mongodb installation using the yum package. Use the package resource to install the mongodb installation. (Chef Reference - https://docs.chef.io/resource_package.html)

package 'Install MongoDB' do
  package_name 'mongodb-org'
  action :install
end
