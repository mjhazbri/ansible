Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |rs|
    rs.memory = 2048
    rs.cpus = 2
  end

  # Will not check for box updates during every startup.
  config.vm.box_check_update = false
  # Master node where ansible will be installed
  config.vm.define "controller.fr.net.intra" do |controller|
    controller.vm.hostname = "controller.fr.net.intra"
    controller.vm.network "private_network", ip: "192.168.56.10"
    controller.vm.provision "shell", path: "bootstrap.sh"
    controller.vm.synced_folder "shared/manager", "/home/vagrant/manager", type: "virtualbox", create:true
    controller.vm.provider :virtualbox do |vb|
      vb.name = "controller.fr.net.intra"
    end
  end

  # MACHINE = ["s01vl9995163.fr.net.intra","s01vl9995246.fr.net.intra","s01vl9995267.fr.net.intra","s01vl9995268.fr.net.intra","s01vl9995277.fr.net.intra","s01vl9995279.fr.net.intra","s01vl9995282.fr.net.intra","s01vl9995284.fr.net.intra","s01vl9995285.fr.net.intra","s01vl9995264.fr.net.intra","s01vl9995266.fr.net.intra","s01vl9995269.fr.net.intra","s01vl9995278.fr.net.intra,","s01vl9995286.fr.net.intra","s01vl9995287.fr.net.intra","s01vl9995288.fr.net.intra"]
  MACHINE = ["s01vl9995247.fr.net.intra","s01vl9995271.fr.net.intra","s01vl9995273.fr.net.intra","s01vl9995270.fr.net.intra","s01vl9995272.fr.net.intra"]
  
  N = 4

  (0..N).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.hostname = MACHINE[i]
      node.vm.network :private_network, ip: "192.168.56.#{11+i}"
      node.vm.provision "shell", path: "bootstrap.sh"
      node.vm.provider :virtualbox do |vb|
        vb.name = MACHINE[i]
      end
    end
  end

end
