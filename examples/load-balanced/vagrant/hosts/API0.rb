Vagrant.configure("2") do |config|
  config.vm.define "api0" do |api0|
    api0.vm.provider :virtualbox do |vb|
      vb.name = "ansible-onadata-lb-api0"
      vb.memory = 4096
      vb.cpus = 2
    end

    api0.vm.network "private_network", ip: "10.0.0.3"
  end
end
