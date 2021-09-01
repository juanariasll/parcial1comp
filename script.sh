#!/bin/bash
sudo apt install -y vim net-tools
sudo snap install lxd --channel=4.0/stable
newgrp lxd
lxd init --auto
lxc launch ubuntu:20.04 haproxy
lxc exec haproxy -- sudo apt-get update && sudo apt-get upgrade -y
lxc exec haproxy -- apt-get install haproxy -y
lxc exec haproxy -- sudo systemctl enable haproxy
lxc file push /vagrant/haproxy.cfg haproxy/etc/haproxy/
lxc file push /vagrant/503.http haproxy/etc/haproxy/errors/
sudo lxc config device add haproxy m80 proxy listen=tcp:192.168.50.8:80 connect=tcp:127.0.0.1:80
lxc exec haproxy -- sudo systemctl restart haproxy





