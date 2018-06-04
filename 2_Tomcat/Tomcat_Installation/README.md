# Tomcat_Installation
This cookbook achieves the required goal to install Tomcat on a RHEL Based Target System

## Goal
* This cookbook successfully translates the install.rb to a chef code and completes the installation.

## Tools and Resources Used
* The following tools were used to setup the environment.
    * Vagrant
    * VirtualBox
    * ChefDK
    * Centos VM provisioned on Vagrant and chefdk installed on it.
    * VIM tool
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

* Clone this repo on the VM that has ChefDK installed on it:
    ``` bash
    mkdir workshop
    cd workshop
    git clone https://github.com/imadroitgen/workshops
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
