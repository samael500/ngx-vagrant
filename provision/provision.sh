#!/bin/bash
sudo apt-get -y update

# Install dependencies
sudo apt-get -y install make nginx-extras lua5.1 git-core luarocks
sudo luarocks install luaposix
sudo luarocks install JSON4Lua

# Configure Nginx
sudo rm /etc/nginx/sites-available/default
sudo ln -s /home/vagrant/proj/app/nginx.conf /etc/nginx/sites-available/default
sudo service nginx restart
