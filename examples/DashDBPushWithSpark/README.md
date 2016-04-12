#### Overview

This example retrieves data from a dashDB sample schema and saves it to the user's schema using spark.  This example is run by gradle and using ssh:

 1. create a temporary folder in the user's home folder on the cluster
 1. download db2 jdbc jar files from the cluster to the local build environment
 2. upload db2 jdbc jar files and spark script from the local build environment to the temporary user's folder on the cluster
 3. create a table for exporting the data to
 4. execute pyspark to import the data and export it again
 5. verify some data was exported
 6. cleanup by removing the temporary folders and tables

Take a look at the [build.gradle](./build.gradle) file, starting with the Example task defintion `task('Example') { ... }`  and then move on to the spark script [exporttodashdb.py](./exporttodashdb.py) to see exactly what is being done.

*********************************************************************
#### Instructions

Ensure you have followed the Setup Instructions on the [project home page README](https://github.com/snowch/biginsight-examples), then edit your connection.properties file so that it has a property `dashdb_push_jdbc_url` that points to your dashDB account:

```
dashdb_push_jdbc_url:jdbc:db2://changeme:50001/BLUDB:user=changeme;password=changeme;sslConnection=true;
```

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
./gradlew -p examples/DashDBPushWithSpark Example
```
*********************************************************************
