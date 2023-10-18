Vagrant.configure("2") do |config|
  config.vm.define "api1" do |api1|
    api1.vm.provider :virtualbox do |vb|
      vb.name = "ansible-onadata-lb-api1"
      vb.memory = 1024
      vb.cpus = 1
    end

    api1.vm.network "private_network", ip: "192.168.56.4"
  end
end
