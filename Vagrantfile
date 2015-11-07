# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

 # Start of nginx web load balancer
  config.vm.define "web" do |web|
    web.vm.box = "bento/centos-6.7"
    web.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end # End of nginx

 # Start of go app1
  config.vm.define "app1" do |app1|
    app1.vm.box = "bento/centos-6.7"
    app1.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end # End of go app1

 # Start of go app2
  config.vm.define "app2" do |app2|
    app2.vm.box = "bento/centos-6.7"
    app2.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end # End of go app2

 # Start of chef
 config.vm.provision "chef_zero" do |chef|
   chef.cookbooks_path = "./cookbooks"
   
 end  # End of chef

end # End of Vagrantfile
