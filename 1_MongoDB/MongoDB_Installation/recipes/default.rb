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
