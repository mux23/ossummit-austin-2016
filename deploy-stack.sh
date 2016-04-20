#!/bin/bash

# step one! get devstack...
cd ~
sudo apt-get update
sudo apt-get -y upgrade
sudo git clone https://git.openstack.org/openstack-dev/devstack
sudo ./devstack/tools/create-stack-user.sh

# step two! get my crap
echo ""
echo "Copying local.conf and local.sh into the devstack directory..."
echo ""
sudo cp ~/ossummit-austin-2016/local.conf ~/devstack/local.conf
sudo cp ~/ossummit-austin-2016/local.sh ~/devstack/local.sh

# make networking work for vms
echo ""
echo "Adding ipables masquerade rule so that VMs can talk to the world..."
echo ""
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# get ready to deploy the stack
cd ~
sudo chown stack.stack devstack -R

# finito
echo ""
echo "Done! Now become root, then become the stack user, and then deploy the"
echo "stack using -- time /home/ubuntu/devstack/stack.sh -- "
echo ""
