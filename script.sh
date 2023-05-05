#!/bin/bash

# Variable Declaration
PACKAGE='httpd wget unzip'
SVC='httpd'
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR='/tmp/webfiles'

#Installing Dependencies
echo "##############################"
echo "Installing packages"
echo "##############################"
brew install $PACKAGE -y > /dev/null
echo 

# Start & Enable Service
echo "#########################"
echo "Start & Enable HTTPD service"
echo "#########################"
sudo apachectl start
sudo apachectl enable
echo "##########################"

# Enabling mod_status
echo "#########################"
echo "Enabling mod_status"
echo "#########################"
sudo sed -i 's/#ExtendedStatus On/ExtendedStatus On/g' /etc/httpd/conf/httpd.conf
sudo sed -i 's/#Require ip 127.0.0.1/Require ip all/g' /etc/httpd/conf/httpd.conf
sudo systemctl restart $SVC
echo

# Creating Temp Directory
echo "#########################"
echo "Starting Artifact Deployment"
echo "#########################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /Library/WebServer/Documents/
echo

# Bounce Service
echo "#############################"
echo "Restarting HTTPD service"
echo "#############################"
sudo systemctl restart $SVC
echo

# Clean up
echo "###########################"
echo "Removing files"
echo "##########################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /Library/WebServer/Documents/
echo

echo "Go to http://localhost/server-status in the web browser of your choice."
