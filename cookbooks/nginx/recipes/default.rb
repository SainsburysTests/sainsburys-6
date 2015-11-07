#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, Ali Fay
#
# All rights reserved - Do Not Redistribute
#

package "nginx"

cookbook_file '/etc/nginx/conf.d/default.conf' do
  source 'sainsburys-lb-config.conf'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

service "nginx" do
  action :start
end
