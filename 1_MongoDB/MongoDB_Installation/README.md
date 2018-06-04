# MongoDB_Installation
This cookbook achieves the required goal to install MongoDB on a RHEL Based Target System

## Goal
* This cookbook successfully translates the install.rb to a chef code and completes the MongoDB installation.

## Tools and Resources Used
* The following tools were used to setup the environment.
    * Vagrant
    * VirtualBox
    * ChefDK
    * Centos VM provisioned on Vagrant and chefdk installed on it.
    * VIM tool
* The Chef Resources used in this cookbook are :
    * Directory
    * Package
    * Template
    * Service
    
## Instructions to run the cookbook

Please follow the below instructions to run the cookbook

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
## Verification
Login to the database using 'mongo' user
