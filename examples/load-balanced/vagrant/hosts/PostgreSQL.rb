Vagrant.configure("2") do |config|
  config.vm.define "postgres" do |postgres|
    postgres.vm.provider :virtualbox do |vb|
      vb.name = "ansible-onadata-lb-postgres"
      vb.memory = 1024
      vb.cpus = 1
    end

    postgres.vm.network "private_network", ip: "192.168.56.5"
  end
end
