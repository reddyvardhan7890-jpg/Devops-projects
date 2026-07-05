#!/bin/bash

echo "Removing old website..."
sudo rm -rf /usr/share/nginx/html/*

echo "Copying website files..."
sudo cp -r website/* /usr/share/nginx/html/

echo "Creating CGI directory..."
sudo mkdir -p /usr/lib/cgi-bin

echo "Copying shell scripts..."
sudo cp *.sh /usr/lib/cgi-bin/

echo "Setting permissions..."
sudo chown root:root /usr/lib/cgi-bin/*.sh
sudo chmod 755 /usr/lib/cgi-bin/*.sh

echo "Restarting services..."
sudo systemctl restart nginx
sudo systemctl restart atd

echo "Configuring msmtp..."
sudo cp msmtprc.template /etc/msmtprc
sudo chmod 600 /etc/msmtprc
sudo chown root:root /etc/msmtprc

echo "Deployment successful"