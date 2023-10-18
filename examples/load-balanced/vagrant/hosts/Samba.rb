Vagrant.configure("2") do |config|
  config.vm.define "samba" do |samba|
    samba.vm.provider :virtualbox do |vb|
      vb.name = "ansible-onadata-lb-samba"
      vb.memory = 1024
      vb.cpus = 1
    end

    samba.vm.network "private_network", ip: "192.168.56.6"
  end
end
