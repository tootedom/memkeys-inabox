# Memkeys RPM Build

A local vm that is used for building an rpm package of : https://github.com/bmatheny/memkeys

The rpm will install memkeys into /usr/sbin

## Install Virtual box

Install Virtual box from https://www.virtualbox.org/wiki/Downloads
    
## Vagrant

Install vagrant from http://www.vagrantup.com/downloads.html

Then add the following box:

    vagrant box add centos64-x86_64-20140116 https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box

## Building the memkeys rpm

Clone this project, and cd into the cloned dir `cd memkeys-inabox`

The run `vagrant up`.  This will take about 5 mins.  This is dependent on your internet connection 
(to `yum install` dependencies), and the speed of your local host machine. 

This will load the centos vm, and install the build dependencies for creating the memkeys x86_64 rpm.

The resulting rpm will appear in the `sharedfolder` dir.

    -rw-r--r--  1 dominictootell  staff   85528 12 Apr 18:47 memkeys-1.0-0.el6.x86_64.rpm
