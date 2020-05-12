##### Created by Amit Kumar Yadav, 7982540035, itamit2017@gmail.com  #####


This is the document to use this setup. I created and setup in my own environment.

### prepare infrastructure...... 
### Running the services........

I created the complete infrastructure from starting. creating Ansible master and nodes. 

To prepare infrastructure folowing are steps...
	1) Copy and Run init-node.sh on node as root user or sudo user (require root privileges). It will create a user ansible and add this user as sudo.
	2) This script require user intraction to enter password for new user. Enter password (say 'ansible').
	3) Run init-master.sh on master. This will copy ssh pub key to node, it will ask for node ip to which you want to copy the key.
	4) Add node IP to /etc/ansible/hosts. define with tag [nodes].
	5) Run "ansible-playbook playbook/setup-node.yml -l nodes" to check required setup and update.
	6) Run "ansible-playbook playbook/copy-project.yml -l nodes" to copy project file to nodes.
	7) Run "ansible-playbook playbook/start-service.yml -l nodes" to start the services. 
	8) Run "ansible-playbook playbook/stop-service.yml -l nodes" to stop the services.

###	NOTE :: when running start service playbook, it will start services and check for service status.
###	Due to self sign certificate, it will will test as failed. But in actual it is running. You cann verify from node itself.
###	run "curl -k http://localhost:8000" this will load the page successfully.


