# Sainsburys Technical Test
Technical test repo for Sainsburys  (To be removed when finished - please let me know.)

### Notes

* This was developed on OSX 10.11.1, Vagrant 1.7.4, VirtualBox 5.0.8 and ChefDK 0.9.0
* All code was hand written (apart from the 'host_file_update' cookbook - https://developer.rackspace.com/blog/chef-creating-dynamic-host-files/), although in production I would likely consider forking and using the 'official' nginx, golang Chef repositories.
* Kitchen was used for testing the recipes - and is included in the repo.
* go app code is pulled from a public repository, separate to this project ( https://github.com/completerevolution/sainsburys and https://github.com/completerevolution/sainsburys-app )
* The target OS is CentOS 6.7, as it's the one I'm most used to (Amazon Linux equivilant).  Many of the recipes are cross-family, by using 'package' as opposed to 'yum_package'.  With more work, it could be _completely_ cross-family (Linux platform - Debian/CentOS)
* Both backend servers are referenced by static IP, but with some work, the nginx config template could be dynamically populated (either IPs or through DNS).


### How to run (OSX)
0.  Install Vagrant ( https://www.vagrantup.com/ ) and VirtualBox (for cross-platform compatability) ( https://www.virtualbox.org/ ).   Chef client is automatically installed in the nodes.
1.  Clone this public git project ( https://github.com/completerevolution/sainsburys.git )
2.  cd to sainsburys
3.  vagrant up --provider virtualbox
4.  curl http://192.168.33.2 && curl http://192.168.33.2

If curl is not available, open a browser to http://192.168.33.2 (and refresh)
