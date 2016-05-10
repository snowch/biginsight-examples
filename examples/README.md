See the README file in each project for instructions how to run the example.

*********************************************************************

#### Hdfs (Using Knox API - WebHDFS)

##### *Groovy*

- List folder contents using Groovy [[WebHdfsGroovy](./WebHdfsGroovy/)]
- Create a folder using Groovy [[WebHdfsGroovy](./WebHdfsGroovy/)]
- Upload a file using Groovy [[WebHdfsGroovy](./WebHdfsGroovy/)]

##### *cURL*

- List folder contents using cURL [[WebHdfsCurl](./WebHdfsCurl/)]
- Create a folder using cURL [[WebHdfsCurl](./WebHdfsCurl/)]
- Upload a file using cURL [[WebHdfsCurl](./WebHdfsCurl/)]

NOTE: The cURL examples require a Unix like environment (e.g. cygwin on Windows) with bash and curl installed.

*********************************************************************

#### Ambari

- Get cluster name and then services installed on cluster [[Ambari](./Ambari)]
- Perform HDFS Service Check via Ambari REST [[Ambari](./Ambari)]
- Show hosts for services (BIGSQL, KNOX, BIGR, etc)  [[Ambari](./Ambari)]

*********************************************************************

#### BigR

- Connect to BigR [[BigR](./BigR)]
- Upload data to HDFS using BigR [[BigR](./BigR)]
- Upload data, fit a linear model and calculate predictions [[BigR](./BigR)]
- Fit a kmeans model to example dataset and calculate clusters [[BigR](./BigR)]

NOTE: The BigR examples require R installed locally.

*********************************************************************

#### BigSQL

- Connect to Big SQL from Groovy [[BigSQLGroovy](./BigSQLGroovy)]
- Insert/Select with Big SQL from Groovy [[BigSQLGroovy](./BigSQLGroovy)]
- Load/Select with Big SQL from Groovy [[BigSQLGroovy](./BigSQLGroovy)]
- Connect to Big SQL from Java [[BigSQLJava](./BigSQLJava)]
- Create external table on existing HDFS data [[BigSQLGroovy](./BigSQLGroovy)]
- Export data as CSV to HDFS from SQL [[BigSQLGroovy](./BigSQLGroovy)]
- Federated query to dashDB [[BigSQLGroovy](./BigSQLGroovy)] see [Federation README](.//BigSQLGroovy/README_Federation.md)

*********************************************************************

#### Hive

- Connect to Hive from Groovy [[HiveGroovy](./HiveGroovy)]
- Connect to Hive from Java  [[HiveJava](./HiveJava)]
- Start a Hive Beeline Session [[HiveBeeline](./HiveBeeline)]

*********************************************************************

#### Spark (run inside a ssh session on the BigInsights cluster)

- Submit a spark python job [[SparkWordCount](./SparkWordCount)]
- Submit a spark scala job [[SparkWordCount](./SparkWordCount)]

*********************************************************************

#### Spark Streaming (run inside a ssh session on the BigInsights cluster)

- Submit a spark streaming python job [[SparkStreamingPythonSsh](./SparkStreamingPythonSsh)]

*********************************************************************

#### Oozie (Using Knox API)

- Submit a Java Mapreduce job using Groovy [[OozieWorkflowMapReduce](./OozieWorkflowMapReduce)]
- Submit a Java Mapreduce job using cURL [[OozieWorkflowCurl](./OozieWorkflowCurl)]
- Submit a Java Spark job using Groovy [[OozieWorkflowSpark](./OozieWorkflowSpark)]

NOTE: OozieWorkflowCurl requires a Unix like environment (e.g. cygwin on Windows) with bash and curl installed.

*********************************************************************

#### HBase

- Connect to HBase using Groovy [[HBaseGroovy](./HBaseGroovy)]
- Manipulate Schema and Perform CRUD Operations using Groovy [[HBaseGroovy](./HBaseGroovy)]
- Connect to HBase using Java [[HBaseJava](./HBaseJava)]

*********************************************************************

#### WebHCat/Templeton (Using Knox API)

- Execute a MapReduce Job using Groovy  [[WebHCatGroovy](./WebHCatGroovy)]
- Execute a Pig Job using Groovy [[WebHCatGroovy](./WebHCatGroovy)]
- Execute a Hive Job using Groovy [[WebHCatGroovy](./WebHCatGroovy)]

*********************************************************************

####  Knox

- Run a knox shell client session [[Knoxshell](./Knoxshell)]

*********************************************************************

#### Cloudant

- Pull data from a Cloudant database to HDFS using Spark [[CloudantIntegrationWithSpark](./CloudantIntegrationWithSpark)]
- Push data from HDFS to a Cloudant database using Spark [[CloudantIntegrationWithSpark](./CloudantIntegrationWithSpark)]

*********************************************************************

#### Object Store (Swift, S3)

- Pull data from a object store to HDFS using Spark [[ObjectStoreIntegrationWithSpark](./ObjectStoreIntegrationWithSpark)]
- Push data from HDFS to a object store using Spark [[ObjectStoreIntegrationWithSpark](./ObjectStoreIntegrationWithSpark)]

*********************************************************************

#### dashDB

- Pull data from a dashDB database to HDFS using Spark [[DashDBIntegrationWithSpark](./DashDBIntegrationWithSpark)]
- Push data to dashDB database using Spark [[DashDBIntegrationWithSpark](./DashDBIntegrationWithSpark)] 
- Pull data from a dashDB database using Big SQL [[DashDBPullWithBigSQL](./DashDBPullWithBigSQL)]
- Federated query to dashDB [[BigSQLGroovy](./BigSQLGroovy)] see [Federation README](.//BigSQLGroovy/README_Federation.md)

*********************************************************************

#### Elasticsearch

- Push data to Elasticsearch using Spark [[ElasticsearchIntegrationWithSpark](./ElasticsearchIntegrationWithSpark)] 
- Pull data from Elasticsearch to HDFS using Spark [[ElasticsearchIntegrationWithSpark](./ElasticsearchIntegrationWithSpark)] 

*********************************************************************

#### Additional scripts

If you would like an example script that has not been included here, please look in the [enhancement issues](https://github.com/snowch/biginsight-examples/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement) for similar requests.  If a similar request exists, add a comment with your +1.  If a ticket doesn't exist, please create a new one.
