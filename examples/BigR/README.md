### Overview

This script has three parts, the first part is a gradle script [./build.gradle](./build.gradle) that:

- creates a truststore using the java keytool command and imports your certificate from your BigInsights cluster
- uses ssh to download the file `/usr/ibmpacks/current/bigr/bigr/bigr_*.tar.gz` from the cluster mastermanager node
- executes a R script [./install_packages.r](./install_packages.r) using the Rscript command line tool
- executes a R script [./example.r](./example.r) using the Rscript command line tool

The second part is a R script [./install_packages.r](./install_packages.r) that:

- installs prerequisite packages for BigR
- installs the `bigr_*.tar.gz` file downloaded from the cluster

The third part is a R script, e.g. [./connect.r](./connect.r) that:

- loads the bigr library
- attempts to connect to the cluster
- verifies the connection was successful

Also, see the other example r scripts in this folder.

*********************************************************************
### Instructions

Ensure that you have a relatively new verion of R installed (3.2+).

Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew Example
```

- on Windows using:

```
../../gradlew.bat Example
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/BigR Example
```
*********************************************************************
### Known issues
 
This script may fail the first time it is run, but may run ok if you try it again.

This script may fail to install the r components and libraries on your client machine.  If that is the case, you can try running R inside a virtual machine using these steps:

- install [virtualbox](https://www.virtualbox.org/)
- install [vagrant](https://www.vagrantup.com/)
- open a terminal 
- ensure you are in the top level directory of this project that contains Vagrantfile
- run `vagrant up` on your client machine - this starts the virtualmachine and sets it up with the biginsight examples
- run `vagrant ssh -c "hostname -I | cut -d' ' -f2-"` - this gets the ip address of the virtual machine
- open a web browser using the IP address from the previous step and the port 8787 - http://youripaddress:8787
- login using username: vagrant, password: vagrant
- in rstudio file navigator, open `biginsight-examples/examples/BigR/connect_template.r`
- execute `connect_template.r` in rstudio to connect to your cluster
