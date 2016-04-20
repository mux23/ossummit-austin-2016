#!/usr/bin/env bash

# this script is executed by the 'stack' user after running './stack.sh'

# pull in a keypair
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
curl https://riotnrrd.com/norcal-drew.pub -o ~/.ssh/norcal-drew.pub
chmod 600 ~/.ssh/norcal-drew.pub

# become admin, sort of
cd /home/ubuntu/devstack
source ./openrc admin alt_demo
nova keypair-add --pub-key ~/.ssh/norcal-drew.pub drew_keypair

