# MongoDB_Installation
This cookbook achieves the required goal to install MongoDB on a RHEL Based Target System

In addition to the mandatory goal it also includes the following Bonus Tasks
* Testing
  * Inspec Tests
  * ChefSpec Unit Tests
* Refactor to support multiple operating systems

## Goal
* This cookbook successfully translates the install.rb to a chef code and completes the MongoDB installation. It additional supports 100% Unit Test Coverage using ChefSpec and Integration Tests using Inspec.

## Tools and Resources Used
* The following tools were used to setup the environment.
    * Vagrant
    * VirtualBox
    * ChefDK
    * Centos VM provisioned on Vagrant and chefdk installed on it.
    * VIM tool
    * Kitchen
    * ChefSpec
    * Inspec
* The Chef Resources used in this cookbook are :
    * Directory
    * Package
    * Template
    * Service
    
## Instructions to run the cookbook

Please follow the below instructions to run the cookbook

### Option 1 - Running the cookbook on a RHEL/Ubuntu VM


* Clone this repo on the VM that has ChefDK installed on it:
    ``` bash
    git clone git@github.com:imadroitgen/workshops.git
    ``` 
* Perform the below actions:
    ``` bash
    cd workshops/1_MongoDB/
    cp -p -r MongoDB_Installation (Cookbooks directory -> eg: /home/vagrant/cookbooks/)
    ```
* Run chef-client 
    ``` bash
    sudo chef-client -z -r "recipe[MongoDB_Installation]"
    ```
* Perform Unit Tests
    ``` bash
    chef exec rspec spec/unit/recipes/default_spec.rb
    ```

* Perform Integration Tests using Inspec
   ``` bash
   inspec exec test/integration/default/default_test.rb
   ```

## Verification
Login to the database using 'mongo' user
