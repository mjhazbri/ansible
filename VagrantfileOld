# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.provider "virtualbox" do |rs|
    rs.memory = 2048
    rs.cpus = 2
  end

  # Will not check for box updates during every startup.
  config.vm.box_check_update = false


  # Master node where ansible will be installed
  config.vm.define "controller" do |controller|
    controller.vm.box = "ubuntu/focal64"
    controller.vm.hostname = "controller.mjhazbri"
    controller.vm.network "private_network", ip: "192.168.56.3"
    controller.vm.provision "shell", path: "bootstrap.sh"
    #controller.vm.provision "file", source: "key_gen.sh", destination: "/home/vagrant/"
    controller.vm.synced_folder "shared/manager", "/home/vagrant/manager", type: "virtualbox", create:true
    controller.vm.provider :virtualbox do |vb|
      vb.name = "controller"
    end
  end

  # Managed node 1.
  config.vm.define "ui" do |ui|
    ui.vm.box = "ubuntu/focal64"
    ui.vm.hostname = "ui.mjhazbri"
    ui.vm.network "private_network", ip: "192.168.56.4"
    ui.vm.provision "shell", path: "bootstrap.sh"
    ui.vm.synced_folder "shared/ui", "/home/vagrant/ui", type: "virtualbox", create:true
    ui.vm.provider :virtualbox do |vb|
      vb.name = "ui"
    end
  end

  # Managed node 1.
  config.vm.define "front" do |front|
    front.vm.box = "ubuntu/focal64"
    front.vm.hostname = "front.mjhazbri"
    front.vm.network "private_network", ip: "192.168.56.5"
    front.vm.provision "shell", path: "bootstrap.sh"
    front.vm.synced_folder "shared/node", "/home/vagrant/node", type: "virtualbox", create:true
    front.vm.provider :virtualbox do |vb|
      vb.name = "front"
    end
  end

  # Managed node 2.
  config.vm.define "back" do |back|
    back.vm.box = "ubuntu/focal64"
    back.vm.hostname = "back.mjhazbri"
    back.vm.network "private_network", ip: "192.168.56.6"
    back.vm.provision "shell", path: "bootstrap.sh"
    back.vm.synced_folder "shared/node", "/home/vagrant/node", type: "virtualbox", create:true
    back.vm.provider :virtualbox do |vb|
      vb.name = "back"
    end
  end

end
