#### Overview

This example retrieves data from a dashDB database and saves it to HDFS.


*********************************************************************
#### Instructions

Make sure your connection.properties file has values set to point to the dashDB account:

```
dashdb_pull_jdbc_url:jdbc:db2://changeme:50001/BLUDB:user=changeme;password=changeme;sslConnection=true;
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
./gradlew -p examples/DashDBPullWithSpark Example
```
*********************************************************************
