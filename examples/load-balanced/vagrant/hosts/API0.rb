Vagrant.configure("2") do |config|
  config.vm.define "api0" do |api0|
    api0.vm.provider :virtualbox do |vb|
      vb.name = "ansible-onadata-lb-api0"
      vb.memory = 1024
      vb.cpus = 1
    end

    api0.vm.network "private_network", ip: "192.168.56.3"
  end
end
