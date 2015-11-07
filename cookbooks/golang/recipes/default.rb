#
# Cookbook Name:: golang
# Recipe:: default
#
# Copyright 2015, Ali Fay
#
# All rights reserved - Do Not Redistribute
#

package 'golang'

# Setting custom go paths
%w[ /opt/go /opt/go/src /opt/go/bin /opt/go/gopath ].each do |path|
  directory path do
    owner 'root'
    group 'root'
    mode '0755'
  end
end
