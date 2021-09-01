#!/bin/bash
sudo apt install -y vim net-tools
sudo snap install lxd --channel=4.0/stable
newgrp lxd
lxd init --auto
lxc launch ubuntu:20.04 web1
lxc exec web1 -- sudo apt-get update && sudo apt-get upgrade -y
lxc exec web1 -- apt-get install apache2 -y
lxc exec web1 -- sudo systemctl enable apache2
lxc file push /vagrant/index1.html web1/var/www/html/index.html
lxc config device add web1 mypor80 proxy listen=tcp:192.168.50.9:80 connect=tcp:127.0.0.1:80
lxc exec web1 -- sudo systemctl restart apache2
lxc launch ubuntu:20.04 web1bu
lxc exec web1bu -- sudo apt-get update && sudo apt-get upgrade -y
lxc exec web1bu -- apt-get install apache2 -y
lxc exec web1bu -- sudo systemctl enable apache2
lxc file push /vagrant/index1bu.html web1bu/var/www/html/index.html
lxc config device add web1bu backuport8 proxy listen=tcp:192.168.50.9:2080 connect=tcp:127.0.0.1:80
lxc exec web1bu -- sudo systemctl restart apache2






