#!/bin/bash
sudo apt-get -y update

# Install dependencies
sudo apt-get -y install nginx-extras lua5.1 git-core luarocks

# Configure Nginx
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/vagrant/proj/app/nginx.conf /etc/nginx/sites-available/default
sudo service nginx restart
