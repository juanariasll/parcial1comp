#!/bin/bash
sudo apt install -y vim net-tools
sudo snap install lxd --channel=4.0/stable
newgrp lxd
lxd init --auto
lxc launch ubuntu:20.04 web2
lxc exec web2 -- sudo apt-get update && sudo apt-get upgrade -y
lxc exec web2 -- apt-get install apache2 -y
lxc exec web2 -- sudo systemctl enable apache2
lxc file push /vagrant/index2.html web2/var/www/html/index.html
lxc config device add web2 myport280 proxy listen=tcp:192.168.50.10:80 connect=tcp:127.0.0.1:80
lxc exec web2 -- sudo systemctl restart apache2
lxc launch ubuntu:20.04 web2bu
lxc exec web2bu -- sudo apt-get update && sudo apt-get upgrade -y
lxc exec web2bu -- apt-get install apache2 -y
lxc exec web2bu -- sudo systemctl enable apache2
lxc file push /vagrant/index2bu.html web2bu/var/www/html/index.html
lxc config device add web2bu mypback proxy listen=tcp:192.168.50.10:1180 connect=tcp:127.0.0.1:80
lxc exec web2bu -- sudo systemctl restart apache2






