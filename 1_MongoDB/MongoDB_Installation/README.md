# MongoDB_Installation
This cookbook achieves the required goal to install MongoDB on a RHEL Based Target System

## Results
* This cookbook successfully translates the install.rb to a chef code and completes the installation.
* The Chef Resources used in this cookbook are :
    * Directory
    * Template
    * Package
    * Service

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
    cd workshops/1_MongoDB/
    cp -p -r MongoDB_Installation (Cookbooks directory -> eg: /home/vagrant/cookbooks/)
    ```
* Run chef-client 
    ``` bash
    sudo chef-client -z -r "recipe[MongoDB_Installation]"
    ```
