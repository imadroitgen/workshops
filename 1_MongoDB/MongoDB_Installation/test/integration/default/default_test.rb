# # encoding: utf-8

# Inspec test for recipe MongoDB_Installation::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Test 1 : Check if the mongodb-org-3.6.repo file is available with the relevant permissions

describe file ('/etc/yum.repos.d/mongodb-org-3.6.repo') do
 it { should exist }
 its ('owner') { should eq 'root' }
 its ('group') { should eq 'root' } 
end 

# Test 2 : Check the package mongodb-org is installed
describe package('mongodb-org') do
 it { should be_installed } 
end

# Test 3 : Check the service mongod is enabled and running
describe service('mongod') do
 it { should be_enabled }
 it { should be_running }
end

# Test 4 : Check that you are able to logon to mongodb using mongo
describe command('mongo "quit()"') do
  its('stdout') { should match "MongoDB server version: 3.6.5\n" }
end
