#!/bin/bash

# Import MongoDB public GPG key and create a keyring
sudo curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor

# Import FileCloud public GPG key and create a keyring
sudo curl -fsSL https://repo.filecloudlabs.com/static/pgp/filecloud.asc | sudo gpg -o /usr/share/keyrings/filecloud.gpg --dearmor

# Add MongoDB repository to APT sources
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Add FileCloud repository to APT sources
echo "deb [ arch=amd64 signed-by=/usr/share/keyrings/filecloud.gpg ] https://repo.filecloudlabs.com/apt/ubuntu jammy/filecloud/23.232 main" | sudo tee /etc/apt/sources.list.d/filecloud.list

# Update package lists
sudo apt-get update

# Install required packages
sudo apt-get install -y apache2 mongodb-org pigz

# Enable Apache modules
sudo a2enmod mpm_worker rewrite

# Restart Apache to apply changes
sudo systemctl restart apache2

# Install PHP 8.2 without recommended packages
sudo apt-get install -y --no-install-recommends php8.2*

# Accept FileCloud's End User License Agreement and install FileCloud
sudo ACCEPT_EULA=Y apt-get install -y filecloud

