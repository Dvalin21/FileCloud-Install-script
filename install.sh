#!/bin/bash
sudo curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor
sudo curl -fsSL https://repo.filecloudlabs.com/static/pgp/filecloud.asc | sudo gpg -o /usr/share/keyrings/filecloud.gpg --dearmor
sudo echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo "deb [ arch=amd64 signed-by=/usr/share/keyrings/filecloud.gpg ] https://repo.filecloudlabs.com/apt/ubuntu jammy/filecloud/23.232 main" | sudo tee /etc/apt/sources.list.d/filecloud.list

sudo apt-get update
sudo apt-get install apache2 mongodb-org pigz -y
sudo a2enmod rewrite
sudo systemctl restart apache2
sudo apt install -y --no-install-recommends php8.2*
sudo ACCEPT_EULA=Y  apt-get install filecloud -y
