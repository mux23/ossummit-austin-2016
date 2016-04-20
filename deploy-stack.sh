#!/bin/bash

# step one! get devstack...
cd ~
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install git
sudo git clone https://git.openstack.org/openstack-dev/devstack
sudo ./devstack/tools/create-stack-user.sh

# step two! get my crap
sudo cp ~/ossummit-austin-2016/local.conf ~/devstack/local.conf
sudo cp ~/ossummit-austin-2016/local.sh ~/devstack/local.sh
chmod +x ~/devstack/local.sh

# make networking work for vms
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


