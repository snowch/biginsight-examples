# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
   config.vm.box = "ubuntu/trusty64"

   config.vm.provision "shell", privileged: false, inline: <<-SHELL
     sudo apt-get update
     sudo apt-get install -y git r-base openjdk-7-jdk
     git clone https://github.com/snowch/biginsight-examples.git
   SHELL
end
