#!/bin/bash

####################################################################################
#######         This Script is to setup ansible nodes from master.       ###########
#######         Run after node script prepare client nodes for ansible.  ###########
####################################################################################

## copy ssh pub key to ansible node........
## supply ""NODE_IP"" ans password set on node for ansible user
read -p "Enter Node IP : " ip
printf "\ncopying key to $ip"
ssh-copy-id ansible@$ip 

if [$? == 0]
then
	printf "key copied to host.."
	break
else
	printf "\nKey copy failed .. \n"	
fi

## this is to reset ssh settings "PasswordAuthentication" from "yes" to "no" in /etc/ssh/sshd_config
printf "\nchanging setting to PasswordAuthentication yes --> no "
ssh ansible@$ip sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config;cat /etc/ssh/sshd_config |grep PasswordAuthentication;sudo service ssh restart; echo "bye"
exit
printf "\nDone...\n"
