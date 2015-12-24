*********************************************************************
### README
*********************************************************************

This project contains sample scripts to help you quickly get started with BigInsights. Following the steps below, it should take you about 10 mins to perform the following actions programmatically against a BigInsights cluster:

- List HDFS folders
- Execute a Mapreduce job using Oozie
- Create and manipulate a HBase table

These scripts are tested on BigInsights on Cloud (bluemix) but they should also work for BigInsights on-premise.

### Pre-requisites

- Java 7 or 8 installed and JAVA_HOME configured

### Instructions

- Copy connection.properties_template to connection.properties
- Edit connection.properties to point to your BigInsights instance
- Run sample scripts on *nix using:

```
./gradlew -q scripts/{scriptname}.groovy
```

- or on Windows using:

```
gradlew.bat -q scripts/{scriptname}.groovy
```

### Example

```
snowch$ ./gradlew -q scripts/ExampleWebHdfsLs.groovy
...
>> [app-logs, apps, iop, mapred, mr-history, securedir, tmp, user]
```
---

NOTE:  scripts are based on knox-0.5.1: https://github.com/apache/knox/tree/v0.5.1/gateway-release/home/samples

