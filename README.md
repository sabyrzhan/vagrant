# Vagrant provisions
## Provisions
* `vagrant_openjdk_hadoop` -- installs OpenJDK 11 and Hadoop. Used as a base box for other provisions.
* `vagrant_hadoop` -- copies Hadoop configurations to vm. However Hadoop must be manually started.
* `vagrant_k8s` -- configures and boots K8s cluster with node size dfined in Vagrantfile.


## Build and install base box
Information used from https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
1. `vagrant up`
2. `vagrant package --output mynew.box`
3. `vagrant box add mynewbox mynew.box`


## Useful resources
* https://hadoop.apache.org/docs/r3.3.0/hadoop-yarn/hadoop-yarn-common/yarn-default.xml -- YARN settings
* https://phoenixnap.com/kb/install-hadoop-ubuntu -- How to install Hadoop 3 on Ubuntu 20.04
* https://stackoverflow.com/questions/29268845/running-mapreduce-remotely -- how to run job remotely (didnt work yet on my host. Need to investigate)