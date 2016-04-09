#### Overview

This example retrieves data from a Cloudant database (examples.cloudant.com) and saves it to HDFS.


*********************************************************************
#### Instructions

Make sure your connection.properties file has values set to point to the Cloudant account where you want the results saved:

cl_push_hostname:changeme.cloudant.com
cl_push_username:changeme
cl_push_password:changeme

See the [setup instructions](https://github.com/snowch/biginsight-examples) for more information on creating the connection.propertie file.

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
./gradlew -p examples/SparkPythonSsh Example
```
*********************************************************************
