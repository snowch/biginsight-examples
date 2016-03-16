# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
   config.vm.box = "ubuntu/trusty64"

   config.vm.provision "shell", privileged: false, inline: <<-SHELL
     sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
     gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
     gpg -a --export E084DAB9 | sudo apt-key add -

     sudo add-apt-repository ppa:webupd8team/java -y
     echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

     sudo apt-get update
     sudo apt-get install -y git r-base oracle-java8-installer

     git clone https://github.com/snowch/biginsight-examples.git
   SHELL
end
