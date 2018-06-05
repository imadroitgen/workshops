#
# Cookbook:: Tomcat_Installation
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'
require 'chefspec'

describe 'Tomcat_Installation::default' do
  context 'When all attributes are default, on Centos7.2' do
    let(:chef_run) do
      ChefSpec::Coverage.start!
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end
    
    it 'installs OpenJDK Java 1.7' do
      expect(chef_run).to install_package('java-1.7.0-openjdk-devel')
    end

    it 'creates a Tomcat Group' do
      expect(chef_run).to create_group('tomcat')
    end

    it 'creates a Tomcat user' do
      expect(chef_run).to create_user('tomcat')
    end
    
     it 'creates a directory /opt/tomcat' do
      expect(chef_run).to create_directory('/opt/tomcat').with(
        user: 'tomcat',
        group: 'tomcat',
        mode: '0755',
        )
    end

     it 'creates /etc/systemd/system/tomcat.service' do
      expect(chef_run).to create_template('/etc/systemd/system/tomcat.service')
    end

    it 'Enables the Tomcat Service' do
      expect(chef_run).to enable_service('tomcat.service')
    end

     it 'Starts the Tomcat Service' do
      expect(chef_run).to start_service('tomcat.service')
    end

    
end
end
