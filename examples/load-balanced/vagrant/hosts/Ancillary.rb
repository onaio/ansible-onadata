Vagrant.configure("2") do |config|
  config.vm.define "anc" do |anc|
    anc.vm.provider :virtualbox do |vb|
      vb.name = "ansible-onadata-lb-anc"
      vb.memory = 1024
      vb.cpus = 1
    end

    anc.vm.network "private_network", ip: "10.0.0.2"
  end
end
