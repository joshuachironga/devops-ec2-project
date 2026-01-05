#!/bin/bash
# Update packages
sudo apt update -y

# Install nginx
sudo apt install -y nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Optional: add a custom homepage
echo "<h1>Welcome to my automated nginx server!</h1>" | sudo tee /var/www/html/index.html

