Vagrant.configure("2") do |config|
    config.vbguest.auto_update = false 
    config.vm.define "nginx_server" do |nginx|
      nginx.vm.box = "debian/bookworm64"
      nginx.vm.hostname = "servidor-nginx"
      nginx.vm.network "private_network", ip: "192.168.45.13"
      nginx.vm.provision "shell", path: "provision.sh"
      nginx.vm.provision "shell", path: "provision2.sh"
      nginx.vm.provision "shell", path: "provision3.sh"
    end
  end