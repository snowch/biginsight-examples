*********************************************************************
### README
*********************************************************************

This project contains sample scripts  to help you quickly get started with BigInsights. Following the steps below on your client machine, it should take you about 10 mins to perform any of the following actions programmatically against a BigInsights cluster. These scripts are tested on BigInsights on Cloud (bluemix) but they should also work for BigInsights on-premise.

A design decision was taken that the build scripts should be as independent as possible to allow developers to take a standalone example script project and reuse it with minimal effort.  A side effect of this design decision is that there is quite a lot of duplicated code in the build scripts.

#### WebHdfs (Using Knox API)

- List folder contents [[examples/WebHdfsLs](./examples/WebHdfsLs/)]
- Create a folder [[examples/WebHdfsMkdir](./examples/WebHdfsMkdir/)]
- Upload a file [[examples/WebHdfsPut](./examples/WebHdfsPut/)]

#### BigR 

- Connect to BigR (requires R installed locally) [[examples/BigR](examples/BigR)]

#### BigSQL

- Connect to BigSQL from Groovy [[examples/BigSQL](examples/BigSQL)]
- Connect to BigSQL from Java [[examples/BigSQLJava](examples/BigSQLJava)]

#### Hive

- Connect to Hive from Groovy [[examples/Hive](examples/Hive)]
- Connect to Hive from Java  [[examples/HiveJava](examples/HiveJava)]

#### Oozie (Using Knox API)

- Execute a Mapreduce job using Oozie
- Execute a Spark Java job using Oozie (see [Known Issues](#known-issues))
- Execute a Spark Python job using Oozie (see [Known Issues](#known-issues))

#### Spark

- Submit a python job over SSH (coming soon ...)
- Submit a Java job over SSH (coming soon ...)
- Submit a Scala job over SSH (coming soon ...)

#### HBase

- Connect to HBase using Java (see [Known Issues](#known-issues))
- Connect to HBase and create and manipulate a HBase table using Groovy (see [Known Issues](#known-issues))

#### Kafka

- Connect to Kafka from Groovy (coming soon ...)
- Connect to Kafka from Java (coming soon ...)

####  Knox

- Run a knox shell client session [[knoxshell](./knoxshell/)]

*********************************************************************

### Pre-requisites

- Java 7 or 8 installed and JAVA_HOME environment variable set
- You do NOT need to install gradle, the gradlew scripts will setup gradle for you


### Setup Instructions

- Clone this repository
- Copy `connection.properties_template` to `connection.properties`
- Edit `connection.properties` to add your BigInsights instance hostname and credentials
- Export the cluster certificate from your browser. The following steps apply to Firefox:
  - Click the lock icon in your browser's address bar.
  - Click More Information and then View Certificate on the Security page.
  - In the Certificate Viewer, select the Details tab and then click Export.
  - Save the certificate to the filename 'certificate' in this folder
- Ssh into the BigInsights cluster 'mastermanager' node to install the cluster's SSL certificate into ./ssh/known_hosts
- Ssh into the BigInsights cluster 'master-2' node to install the cluster's SSL certificate into ./ssh/known_hosts

*********************************************************************
### Running the scripts

See the README.md file in each example in the [[examples](examples)] folder for instructions how to run the script.
*********************************************************************

### Known issues

#### Execute a Spark Java job using Oozie

This script works on 'Analytics for Apache Hadoop', but not on 'BigInsights on Cloud Basic Plan'.  Debug output can be found in https://your-hostname:8443/gateway/yarnui/yarn/apps

#### Execute a Spark Python job using Oozie 

The documentation for my cluster at https://hostname:8443/gateway/oozieui/oozie/docs/DG_SparkActionExtension.html - suggests that Spark actions are available, however, I receive this error trying to run a spark action:

`java.lang.RuntimeException: java.lang.ClassNotFoundException: Class org.apache.oozie.action.hadoop.SparkMain not found`

spark-assembly.jar is added to the ./lib folder, but on inspection I noticed that spark-assembly.jar does NOT contain a SparkMain class.

#### Create and manipulate a HBase table (using Groovy)

When running this against a standard BigInsights on Cloud cluster, the service returns `HTTP/1.1 500 Server Error`

#### Connect to HBase (using Java)

When running this against a standard BigInsights on Cloud cluster, the service returns `HTTP/1.1 500 Server Error`
