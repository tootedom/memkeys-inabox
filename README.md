# Memkey RPM Build

A local vm that is used for building an rpm package of : https://github.com/bmatheny/memkeys

The rpm will install memkeys into /usr/sbin

## Install Virtual box

Install Virtual box from https://www.virtualbox.org/wiki/Downloads
    
## Vagrant

Install vagrant from http://www.vagrantup.com/downloads.html

Then add the following box:

    vagrant box add centos64-x86_64-20140116 https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box

## Provisioning the grokdebug virtual machine

Clone this project, and cd into the cloned dir `cd memkeys-inabox`

The run `vagrant up`

This will load the centos vm, and install the build dependencies for creating the memkeys x86_64 rpm.

The resulting rpm will appear in the `sharedfolder` dir.

    -rw-r--r--  1 dominictootell  staff   85528 12 Apr 11:38 memkeys-1.0-0.el6.x86_64.rpm
