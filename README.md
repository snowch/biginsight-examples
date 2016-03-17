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

#### Spark (run in a ssh session on the BigInsights cluster)

- Submit a python job [[examples/SparkPythonSsh](examples/SparkPythonSsh)]
- Submit a Java job (coming soon ...)
- Submit a Scala job (coming soon ...)

#### Oozie (Using Knox API)

- Execute a Mapreduce job using Oozie [[examples/OozieWorkflowMapReduce](./examples/OozieWorkflowMapReduce/)]
- Execute a Spark Java job using Oozie [[examples/OozieWorkflowSpark](./examples/OozieWorkflowSpark/)]
- Execute a Spark Python job using Oozie [[examples/OozieWorkflowSparkPython](./examples/OozieWorkflowSparkPython/)]

#### HBase

- Connect to HBase using Java [[examples/HBaseJava](./examples/HBaseJava/)]
- Connect to HBase and create and manipulate a HBase table using Groovy [[examples/HBase](./examples/HBase/)]

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

