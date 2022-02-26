# Vagrant provisions
## Provisions
* `vagrant_openjdk_hadoop` -- installs OpenJDK 11 and Hadoop. Used as a base box for other provisions.
* `vagrant_hadoop` -- copies Hadoop configurations to vm. However Hadoop must be manually started.
* `vagrant_k8s` -- configures and boots K8s cluster with node size defined in Vagrantfile.
* `vagrant_k8s_metallb` -- configures and boots K8s cluster with MetalLB load balancer.
* `vagrant_docker` -- configures and boots new host with `docker` installed.
  In `Vagrantfile` you can set `host_size` - how many hosts you want to boot. Default is `1`.

## VirtulBox host-only network limit
On Linux, Mac OS X and Solaris Oracle VM VirtualBox will only allow IP addresses in 192.168.56.0/21 range to be assigned to host-only adapters. For IPv6 only link-local addresses are allowed. If other ranges are desired, they can be enabled by creating /etc/vbox/networks.conf and specifying allowed ranges there. For example, to allow 10.0.0.0/8 and 192.168.0.0/16 IPv4 ranges as well as 2001::/64 range put the following lines into /etc/vbox/networks.conf:
```
  * 10.0.0.0/8 192.168.0.0/16
  * 2001::/64
```

For more info https://www.virtualbox.org/manual/ch06.html#network_hostonly


## Build and install base box
Information used from https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
1. `vagrant up`
2. `vagrant package --output mynew.box`
3. `vagrant box add mynewbox mynew.box`


## Useful resources
* https://hadoop.apache.org/docs/r3.3.0/hadoop-yarn/hadoop-yarn-common/yarn-default.xml -- YARN settings
* https://phoenixnap.com/kb/install-hadoop-ubuntu -- How to install Hadoop 3 on Ubuntu 20.04
* https://stackoverflow.com/questions/29268845/running-mapreduce-remotely -- how to run job remotely (didnt work yet on my host. Need to investigate)