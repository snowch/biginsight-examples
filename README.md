*********************************************************************
### README
*********************************************************************

This project contains sample scripts to help you quickly get started with BigInsights. Following the steps below, it should take you about 10 mins to perform the following actions programmatically against a BigInsights cluster:

- List HDFS folders
- Execute a Mapreduce job using Oozie
- Execute a Spark Java job using Oozie (see known issues)
- Execute a Spark Python job using Oozie (see known issues)
- Create and manipulate a HBase table

These scripts are tested on BigInsights on Cloud (bluemix) but they should also work for BigInsights on-premise.

A design decision was taken that the build scripts should be independent as possible to allow developers to take a standalone example and reuse it with minimal effort.  A side effect of this design decision is that there is quite a lot of duplicated code in the build scripts.

### Pre-requisites

- Java 7 or 8 installed and JAVA_HOME environment variable set

### Instructions

- Copy connection.properties_template to connection.properties
- Edit connection.properties to point to your BigInsights instance
- View the Example.groovy script you want to run to understand what it does
- Run sample scripts on *nix using:

```
./gradlew -p examples/{dirname} Example
```

- or on Windows using:

```
gradlew.bat -p examples/{dirname} Example
```

### Example

```
snowch$ ./gradlew -p examples/WebHdfsLs Example
...
>> [app-logs, apps, iop, mapred, mr-history, securedir, tmp, user]
```

### Known issues

#### Execute a Spark Java job using Oozie

This script works on 'Analytics for Apache Hadoop', but not on 'Paygo BigInsights on Cloud'.  Debug output can be found in https://your-hostname:8443/gateway/yarnui/yarn/apps

#### Execute a Spark Python job using Oozie 

The documentation for my cluster at https://hostname:8443/gateway/oozieui/oozie/docs/DG_SparkActionExtension.html - suggests that Spark actions are available, however, I receive this error trying to run a spark action:

`java.lang.RuntimeException: java.lang.ClassNotFoundException: Class org.apache.oozie.action.hadoop.SparkMain not found`

spark-assembly.jar is added to the ./lib folder, but on inspection I noticed that spark-assembly.jar does NOT contain a SparkMain class.


---

NOTE:  scripts are based on knox-0.5.1: https://github.com/apache/knox/tree/v0.5.1/gateway-release/home/samples

