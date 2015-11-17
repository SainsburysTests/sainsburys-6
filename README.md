# Sainsburys Technical Test

### Task

Screening test
Please complete the following task. The aim of the task is for you to demonstrate your grasp of key DevOps skills, such as working with source control, automation, orchestration and software configuration management. You should aim to have your results ready to share at least 24 hours prior to your interview. 

a) Compile the following Go source code into a binary executable that can be deployed to a web server. The executable is a very basic HTTP server. You will need to download and install the Go compiler. 
```
package main
import (
        "fmt"
        "net/http"
        "os"
)
func handler(w http.ResponseWriter, r *http.Request) {
        h, _ := os.Hostname()
        fmt.Fprintf(w, "Hi there, I'm served from %s!", h)
}
func main() {
        http.HandleFunc("/", handler)
        http.ListenAndServe(":8484", nil)
}
```
 
b) Write some code you can use to create and launch 3 separate linux nodes using vagrant, packer, docker or any other tool of your choice: 
- 2x application nodes 
- 1x web node 

c) Using a configuration management tool of your choice, e.g. Chef or Ansible: 
- Deploy the Go binary and run it on the application nodes 
- Install and configure Nginx on the web node so that requests are sent to the two application nodes in a round robin fashion. 
- You should demonstrate that the round-robin is working correctly. 
  
We would like to be able to use your code to bring up the nodes with as little typing and hassle as possible. Your code should make it easy to troubleshoot any issues that arise during configuration and deployment. 

d) Commit all your files to a public git repo of your choice, including a README.md with instructions on how to bring up the three nodes. Don’t forget to include the hostname of the web node. 
When we send an http request to the load balancer we expect to see the following message: 
Hi there, I'm served from <web node IP address>!
Bonus point: 
Compile and deploy the code as part of an automated build process. 

==============

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
