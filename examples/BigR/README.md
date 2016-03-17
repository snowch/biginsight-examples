### Overview

This script has three parts, the first part is a gradle script [./build.gradle](./build.gradle) that:

- creates a truststore using the java keytool command and imports your certificate from your BigInsights cluster
- uses ssh to download the file `/usr/ibmpacks/current/bigr/bigr/bigr_*.tar.gz` from the cluster mastermanager node
- executes a R script [./install_packages.r](./install_packages.r) using the Rscript command line tool
- executes a R script [./example.r](./example.r) using the Rscript command line tool

The second part is a R script [./install_packages.r](./install_packages.r) that:

- installs prerequisite packages for BigR
- installs the `bigr_*.tar.gz` file downloaded from the cluster

The third part is a R script [./example.r](./example.r) that:

- loads the bigr library
- attempts to connect to the cluster
- verifies the connection was successful

*********************************************************************
### Instructions

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
 
This script may fail the first time it is run, but will run ok if you try it again.
