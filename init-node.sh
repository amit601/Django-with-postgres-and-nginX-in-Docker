#!/bin/bash

###########################################################################
#######         This Script is to setup ansible nodes.          ###########
#######         prepare client nodes for ansible.               ###########
###########################################################################

##Update
printf "\nUpdating ....\n"
apt-get update

## installing preresquisets
printf "\nInstalling python\n"
apt-get install python python3  python-pip -y

## Install 
printf "\ninstall ..\n"
apt-get install  -y

## adding ansibble user
printf "\nadding user for ansible\n"

useradd -d /home/ansible -m ansible -s /bin/bash
cat /etc/passwd |grep ansible


## allow ansible user to run command as sudo or without password
printf "\nadding ansible user to sudoers file...\n"
echo "ansible ALL=(ALL:ALL) ALL" >>  /etc/sudoers
echo "ansible ALL=NOPASSWD: ALL" >>  /etc/sudoers


## allow ssh to copy rsa keys using password authentication...
sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
printf "\nSetting passsword for ansible user\n"
passwd ansible
service ssh restart
su - ansible
ldconfig

printf "\nall set for now...\n"

