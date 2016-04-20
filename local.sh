#!/usr/bin/env bash

# pull in a keypair
cd ~/.ssh
curl -O https://riotnrrd.com/norcal-drew.pub
chmod 600 norcal-drew.pub
cd

# become admin, sort of
cd ~/devstack
source ./openrc admin alt_demo
nova keypair-add --pub-key ~/.ssh/norcal-drew.pub drew_keypair


