# ossummit-austin-2016

This is support files for my 'Docker and Cinder' talk at the 2016 Openstack Summit in Austin, Texas.

This stuff uses an M4.xlarge instance on AWS, and it's extremely important that that instance has a large disk attached to it, say like 100G - everything will fail if the disk isn't big enough to host a 40G m1.medium instance!

Things to know:
 - the local.conf file implements heat, neutron and ceilometer, and they all work properly. (that was a few days of fighting right there...)
 - the heat template relies on my own public key, hosted on riotnrrd.com
   - you can swap that out pretty easily though, it's pulled in using `curl` from the `local.sh` script, then imported into devstack as `drew_keypair` in the same script.
 - this heat template *also* relies on a custom-baked QCOW2 image, also hosted on riotnrrd.com
   - it's just a default 'trusty' debian image, but because Docker installs take hours on nested VMs I pre-installed it, and rexray, and pre-pulled the postgresql docker image to save time.
 - that pre-baked image has Docker installed and Postgresql pre-pulled
 - this probably just straight-up won't work for you. 
   - or maybe it will! who knows!
   - ...but if it doesn't, I warned you.

How to use:
 - boot an m4.xlarge AWS instance with Ubuntu 14.04 LTS
 - ssh into that instance as the 'ubuntu' user
 - run `sudo apt-get -y install git`
 - run `git clone https://github.com/mux23/ossummit-austin-2016`
 - run `cd ossummit-austin-2016` and `./deploy-stack.sh`

