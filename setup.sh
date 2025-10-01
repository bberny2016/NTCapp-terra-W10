#!/bin/bash
sudo dnf update -y
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<html><h1><p> Welcome to Utrains.<br> You are redirected to ${HOSTNAME} to see how the load balancer is sharing the traffic.</p></h1></html>" | sudo tee /var/www/html/index.html > /dev/null
