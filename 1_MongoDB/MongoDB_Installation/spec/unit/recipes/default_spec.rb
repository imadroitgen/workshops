#
# Cookbook:: MongoDB_Installation
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'
require 'chefspec'

describe 'MongoDB_Installation::default' do
  context 'When all attributes are default, on Centos7.2' do
    let(:chef_run) do
      ChefSpec::Coverage.start!
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'creates mongodb-org-3.6.repo file' do
      expect(chef_run).to create_template('/etc/yum.repos.d/mongodb-org-3.6.repo')
    end

    it 'Installs the MongoDB Package' do
      expect(chef_run).to install_package('mongodb-org')
    end

     it 'Enables the MongoDB Service' do
      expect(chef_run).to enable_service('mongod')
    end

     it 'Starts the MongoDB Service' do
      expect(chef_run).to start_service('mongod')
    end
end
end
