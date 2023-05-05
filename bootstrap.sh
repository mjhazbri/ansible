#!/usr/bin/env bash

# vagrant by default creates its own keypair for all the machines. Password based authentication will be disabled by default and enabling it so password based auth can be done.

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Supressing the banner message everytime you connect to the vagrant box.

touch /home/vagrant/.hushlogin

# Updating the hosts file for all the 3 nodes with the IP given in vagrantfile

# 192.168.56.3 controller.mjhazbri controller
# 192.168.56.4 ui.mjhazbri ui
# 192.168.56.5 font.mjhazbri front
# 192.168.56.6 back.mjhazbri back

#"s01vl9995247.fr.net.intra","s01vl9995271.fr.net.intra","s01vl9995273.fr.net.intra","s01vl9995270.fr.net.intra","s01vl9995272.fr.net.intra"
# echo -e "192.168.56.10 controller.fr.net.intra controller\n192.168.56.11 s01vl9995163.fr.net.intra s01vl9995163\n192.168.56.12 s01vl9995246.fr.net.intra s01vl9995246\n192.168.56.13 s01vl9995267.fr.net.intra s01vl9995267\n192.168.56.14 s01vl9995268.fr.net.intra s01vl9995268\n192.168.56.15 s01vl9995277.fr.net.intra s01vl9995277\n192.168.56.16 s01vl9995279.fr.net.intra s01vl9995279\n192.168.56.17 s01vl9995282.fr.net.intra s01vl9995282\n192.168.56.18 s01vl9995284.fr.net.intra s01vl9995284\n192.168.56.19 s01vl9995285.fr.net.intra s01vl9995285\n192.168.56.20 s01vl9995264.fr.net.intra s01vl9995264\n192.168.56.21 s01vl9995266.fr.net.intra s01vl9995266\n192.168.56.22 s01vl9995269.fr.net.intra s01vl9995269\n192.168.56.23 s01vl9995278.fr.net.intra s01vl9995278\n192.168.56.24 s01vl9995286.fr.net.intra s01vl9995286\n192.168.56.25 s01vl9995287.fr.net.intra s01vl9995287\n192.168.56.26 s01vl9995288.fr.net.intra s01vl9995288" >> /etc/hosts
echo -e "192.168.56.10 controller.fr.net.intra controller\n192.168.56.11 s01vl9995247.fr.net.intra s01vl9995247\n192.168.56.12 s01vl9995271.fr.net.intra s01vl9995271\n192.168.56.13 s01vl9995273.fr.net.intra s01vl9995273\n192.168.56.14 s01vl9995270.fr.net.intra s01vl9995270\n192.168.56.15 s01vl9995272.fr.net.intra s01vl9995272" >> /etc/hosts
# Installing necessary packages 

sudo apt update && sudo apt -y install curl wget net-tools iputils-ping python3-pip sshpass

# Install ansible using pip only in controller node

if [[ $(hostname) = "controller" ]]; then
  sudo pip3 install ansible
fi

