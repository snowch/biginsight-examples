### Overview

This script has two parts, the first part is [./build.gradle](./build.gradle) script that:

- creates a truststore using the java keytool command and imports your certificate for your BigInsights cluster
- uses ssh to download the file `/usr/ibmpacks/current/bigr/bigr/bigr_*.tar.gz` from the cluster mastermanager node
- executes a R script [./example.r](./example.r) using the Rscript command line tool

The second part is the [./example.r](./example.r) that:

- installs some prerequisite packages for BigR
- installs the `bigr_*.tar.gz` file downloaded from the cluster
- attempts to connect to the cluster
- verifies the connection was successful

*********************************************************************

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
