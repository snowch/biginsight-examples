# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
   config.vm.box = "ubuntu/trusty64"

   # setup private network for rstudio access
   config.vm.network "private_network", type: "dhcp"

   if Vagrant.has_plugin?("vagrant-cachier")
     config.cache.scope = :box
   else
     raise Vagrant::Errors::VagrantError.new, "Plugin missing: vagrant-cachier: Install with: `vagrant plugin install vagrant-cachier`"
   end

   # make sure we have enough memory for the build
   config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "2048"]
   end

   config.vm.provision "shell", privileged: false, inline: <<-SHELL

     # abort the script if an error is encountered
     set -e 

     # config to install the latest R
     sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
     gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
     gpg -a --export E084DAB9 | sudo apt-key add -

     # create a folder to cache the jdk tar file
     [[ -d /var/cache/oracle-jdk8-installer/ ]] || sudo mkdir /var/cache/oracle-jdk8-installer/

     # if we have the jdk locally, copy it to the cache location (ignore error if file doesn't exist)
     sudo cp /vagrant/downloads/jdk-8u*-linux-x64.tar.gz /var/cache/oracle-jdk8-installer/ || :

     # config to install Oracle 8 JDK
     sudo add-apt-repository ppa:webupd8team/java -y
     echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

     # Config for BigTop (sqoop)
     wget -O- http://archive.apache.org/dist/bigtop/bigtop-1.1.0/repos/GPG-KEY-bigtop | sudo apt-key add -
     sudo wget -O /etc/apt/sources.list.d/bigtop-1.1.0.list http://archive.apache.org/dist/bigtop/bigtop-1.1.0/repos/trusty/bigtop.list

     # Now install the packages
     sudo apt-get update
     sudo apt-get install -y git r-base oracle-java8-installer

     sudo apt-get install gdebi-core -y
     wget https://download2.rstudio.org/rstudio-server-0.99.902-amd64.deb
     sudo gdebi -n rstudio-server-0.99.902-amd64.deb 

     # copy the jdk to a non volatile folder so we can grab it from here
     # on the next clean `vagrant up`
     cp -f /var/cache/oracle-jdk8-installer/jdk-8u*-linux-x64.tar.gz /vagrant/downloads/

     # Setup the JDK so R can find it
     sudo sh -c 'echo /usr/lib/jvm/java-8-oracle/jre/lib/amd64 >> /etc/ld.so.conf.d/java.conf'
     sudo sh -c 'echo /usr/lib/jvm/java-8-oracle/jre/lib/amd64/server >> /etc/ld.so.conf.d/java.conf'
     sudo ldconfig
     sudo R CMD javareconf

     # Get the BigInsight examples

     git clone https://github.com/snowch/biginsight-examples.git

     cp -f /vagrant/downloads/*.jar ~/biginsight-examples/downloads/

     # provide details for connecting to a BigInsights cluster
     ln -sf /vagrant/certificate ~/biginsight-examples/certificate
     ln -sf /vagrant/connection.properties ~/biginsight-examples/connection.properties

     # get BigInsights cluster hostnames
     bimastermanager=$(grep '^gateway' ~/biginsight-examples/connection.properties |  sed -e 's|^[^/]*//||' -e 's|:.*/.*$||')
     bimaster2=$(echo $bimastermanager | sed 's/mastermanager/master-2/')

     # the scripts rely on ssh'ing into the cluster, so lets install the ssl certificates
     ssh-keyscan $bimastermanager >> ~/.ssh/known_hosts
     ssh-keyscan $bimaster2 >> ~/.ssh/known_hosts

     # create sample script for connecting to BigR
     cd ~/biginsight-examples/examples/BigR
     ./gradlew GenerateSampleScript

     # Now lets run the tests
     cd ~/biginsight-examples/
     ./gradlew -q test

   SHELL

end
