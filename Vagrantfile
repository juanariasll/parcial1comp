# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
if Vagrant.has_plugin? "vagrant-vbguest"
  config.vbguest.no_install = true
  config.vbguest.auto_update = false
  config.vbguest.no_remote = true
end
config.vm.define :haproxyUbuntu do |haproxyUbuntu|
haproxyUbuntu.vm.box = "bento/ubuntu-20.04"
haproxyUbuntu.vm.network :private_network, ip: "192.168.50.8"
haproxyUbuntu.vm.provision "shell", path: "script.sh"
haproxyUbuntu.vm.hostname = "haproxyUbuntu"
end
config.vm.define :servidorUbuntu do |servidorUbuntu|
servidorUbuntu.vm.box = "bento/ubuntu-20.04"
servidorUbuntu.vm.network :private_network, ip: "192.168.50.9"
servidorUbuntu.vm.provision "shell", path: "script2.sh"
servidorUbuntu.vm.hostname = "servidorUbuntu"
end
config.vm.define :servidorUbuntu2 do |servidorUbuntu2|
servidorUbuntu2.vm.box = "bento/ubuntu-20.04"
servidorUbuntu2.vm.network :private_network, ip: "192.168.50.10"
servidorUbuntu2.vm.provision "shell", path: "script3.sh"
servidorUbuntu2.vm.hostname = "servidorUbuntu2"
end
end