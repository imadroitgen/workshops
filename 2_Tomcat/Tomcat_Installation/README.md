# Tomcat_Installation
This cookbook achieves the required goal to install Tomcat on a RHEL Based Target System

In addition to the mandatory goal it also includes the following Bonus Tasks
* Testing
  * Inspec Tests
  * ChefSpec Unit Tests

## Goal

* This cookbook successfully translates the install.rb to a chef code and completes the Tomcat installation. It additional supports 60% Unit Test Coverage using ChefSpec and Integration Tests using Inspec.


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
    * package
    * group
    * user
    * remote_file
    * directory
    * execute
    * template
    * service

## Instructions to run the cookbook

Please follow the below instructions to run the cookbook

### Option 1 - Running the cookbook on a RHEL/Ubuntu VM


* Clone this repo on the VM that has ChefDK installed on it:
    ``` bash
    git clone git@github.com:imadroitgen/workshops.git
    ``` 
* Perform the below actions:
    ``` bash
    cd workshops/2_Tomcat/
    cp -p -r Tomcat_Installation (Cookbooks directory -> eg: /home/vagrant/cookbooks/)
    ```
* Run chef-client 
    ``` bash
    sudo chef-client -z -r "recipe[Tomcat_Installation]"
    ```
* Perform Unit Tests
    ``` bash
    chef exec rspec spec/unit/recipes/default_spec.rb
    ```

* Perform Integration Tests using Inspec
   ``` bash
   inspec exec test/integration/default/default_test.rb
   ```

### Option 2 - Running the cookbook from Local Machine

Pre-Requisites -> ChefDK, Vagrant and Virtualbox needs to be installed on your local machine

* Clone the git repository
``` bash
git clone https://github.com/imadroitgen/workshops
```

* Change the directory to the cookbook
``` bash
cd workshops/2_Tomcat/Tomcat_Installation
```

* Test the Cookbook
``` bash
kitchen test
```

## Verification
Login to the database using 'mongo' user

## Verification
Execute curl http://localhost:8080
