# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

# Start of go app1
  config.vm.define "app1" do |app1|
    app1.vm.box = "bento/centos-6.7"
    app1.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    app1.vm.hostname = "app1"
    app1.vm.network "private_network", ip: "192.168.33.3"
    app1.vm.provision :hosts do |provisioner|
      # Add a single hostname
      provisioner.add_host '192.168.33.3', ['app1.sainsburys.internal']
    end
    app1.vm.provision "chef_zero" do |chef|
      chef.cookbooks_path = "./cookbooks"
      chef.add_recipe "yum::epel"
      chef.add_recipe "vim::default"
      chef.add_recipe "git::default"
      chef.add_recipe "golang::default"
      chef.add_recipe "golang::app"
    end
  end # End of go app1

 # Start of go app2
  config.vm.define "app2" do |app2|
    app2.vm.box = "bento/centos-6.7"
    app2.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
    app2.vm.hostname = "app2"
    app2.vm.network "private_network", ip: "192.168.33.4"
    app2.vm.provision :hosts do |provisioner|
      # Add a single hostname
      provisioner.add_host '192.168.33.4', ['app2.sainsburys.internal']
    end
    app2.vm.provision "chef_zero" do |chef|
      chef.cookbooks_path = "./cookbooks"
      chef.add_recipe "yum::epel"
      chef.add_recipe "vim::default"
      chef.add_recipe "git::default"
      chef.add_recipe "golang::default"
      chef.add_recipe "golang::app"
    end
  end # End of go app2

  # Start of nginx web load balancer
   config.vm.define "web" do |web|
     web.vm.box = "bento/centos-6.7"
     web.vm.provider "virtualbox" do |v|
       v.memory = 1024
     end
     web.vm.hostname = "web"

     web.vm.network "private_network", ip: "192.168.33.2"

     web.vm.provision :hosts do |provisioner|
       # Add a single hostname
       provisioner.add_host '192.168.33.2', ['web.sainsburys.internal']
     end
     web.vm.provision "chef_zero" do |chef|
       chef.cookbooks_path = "./cookbooks"
       chef.add_recipe "yum::epel"
       chef.add_recipe "vim::default"
       chef.add_recipe "nginx::default"
     end


   end # End of nginx

end # End of Vagrantfile
