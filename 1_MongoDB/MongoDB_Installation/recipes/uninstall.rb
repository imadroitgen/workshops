#
# Cookbook:: MongoDB_Installation
# Recipe:: uninstall
#
# Copyright:: 2018, The Authors, All Rights Reserved.
# This recipe uninstalls the mongodb installation performed by the default.rb

# Stop the mongod Service 
service 'mongod' do
 action [ :disable, :stop]
end

# Remove the MongoDB package
package 'Install MongoDB' do
 package_name 'mongodb-org'
 action :remove
end

# Delete the mongodb.repo file

file '/etc/yum.repos.d/mongodb-org-3.6.repo' do
 action :delete
end
