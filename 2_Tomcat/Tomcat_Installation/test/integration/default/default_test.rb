# # encoding: utf-8

# Inspec test for recipe Tomcat_Installation::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Test 1 : Check OpenJDK is Installed

describe package('java-1.7.0-openjdk-devel') do
  it { should be_installed }
end

# Test 2 : Check that the Tomcat Group exists
describe group('tomcat') do
  it { should exist }
end

#Test 3 : Check that the Tomcat User exists
describe user('tomcat') do
  it { should exist }
  its ('group') { should eq 'tomcat' }
  its ('home') { should eq '/opt/tomcat' }
  its ('shell') { should eq '/bin/nologin' }
end

# Test 4 : Check if /opt/tomcat directory exists
describe directory('/opt/tomcat') do
  it { should exist }
  its ('owner') { should eq 'tomcat' }
  its ('group') { should eq 'tomcat' }
end

# Test 5 : Check if the tomcat service is running
describe service('tomcat') do
  it { should be_enabled }
  it { should be_running }
end

# Test 6 : Check if the http port is listening
describe port(8080) do
  it { should be_listening }
end

