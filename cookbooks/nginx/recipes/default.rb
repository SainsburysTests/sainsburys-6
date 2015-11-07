#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, Ali Fay
#
# All rights reserved - Do Not Redistribute
#

package "nginx"

service "nginx" do
  action :start
end
