Vagrant.configure("2") do |config|
  config.vm.define "api1" do |api1|
    api1.vm.provider :virtualbox do |vb|
      vb.name = "ansible-onadata-lb-api1"
      vb.memory = 4096
      vb.cpus = 2
    end

    api1.vm.network "private_network", ip: "10.0.0.4"
  end
end
