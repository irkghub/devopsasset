#!/bin/bash

### This bash script contains commands to create website ###

# Install dependencies first of all

echo "###########################################"
echo "Installing Dependencies at first"
echo "###########################################"
sudo yum install wget unzip httpd -y
echo 

#Starting and enabling the Apache HTTP Server
echo "###########################################"
echo "Starting and enabling Apache HTTP Server"
echo "###########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Define a location to get the artifact
echo "##########################################"
echo "Creating a directory to store the artifact"
echo "#########################################"
mkdir -p /tmp/webassets
cd /tmp/webassets
echo 

#Downloading the artifact
echo "############################################################"
echo "Downloading artifact"
echo "############################################################"
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
unzip 2137_barista_cafe.zip
echo

#Placing the artifact to the Apache HTTP Server hosting directory
echo "############################################################"
echo "Placing the artifact to Apacher Default Host Directory"
echo "########################################################"
cp -r 2137_barista_cafe/* /var/www/html/
echo
 
sudo systemctl reload httpd

#Perform clean up at last
rm -rf /tmp/webassets

#Show the status of the Apache HTTP Server
sudo systemctl status httpd

#Display the contents of /var/www/html/
ls /var/www/html/
