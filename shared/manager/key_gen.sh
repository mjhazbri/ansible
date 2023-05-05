#!/usr/bin/env bash

# THIS SCRIPT WILL CREATE SSH KEYPAIR AND DISTRIBUTE ACROSS ALL NODES

ssh-keygen -b 2048 -t rsa -f /home/vagrant/.ssh/id_rsa -q -N ""

# LOOPING THROUGH AND DISTRIBUTING THE KEY

for val in controller.fr.net.intra s01vl9995247.fr.net.intra s01vl9995271.fr.net.intra s01vl9995273.fr.net.intra s01vl9995270.fr.net.intra s01vl9995272.fr.net.intra; do 
	echo "-------------------- COPYING KEY TO ${val} NODE ------------------------------"
	sshpass -p 'vagrant' ssh-copy-id -o "StrictHostKeyChecking=no" vagrant@$val 
done

PROJECT_DIRECTORY="/home/vagrant/manager/"
cd $PROJECT_DIRECTORY

# running adhoc command to see if everything is fine

ansible all -i inventory -m "shell" -a "uptime"
echo