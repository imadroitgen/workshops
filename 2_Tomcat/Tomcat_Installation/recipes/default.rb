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
