#!/bin/bash
sudo apt-get purge apache2* -y
sudo apt-get purge mongodb* -y
sudo apt-get purge php8.2* -y
sudo apt-get purge pigz* -y
sudo apt-get purge filecloud* -y
sudo apt-get autoremove -y
sudo rm -rf /var/www/html/
sudo rm -rf /opt/fcnodejs fcpushservice fcwebdrm fileclouddata
sudo rm -r /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo rm -r /usr/share/keyrings/mongodb-server-6.0.gpg
sudo rm -r /usr/share/keyrings/filecloud.gpg
sudo rm -r /etc/apt/sources.list.d/filecloud.list
