#### Overview

##### Example Push to Elasticsearch

This example creates some example data and saves it to the user's elasicsearch server.  This example is run by gradle and uses ssh to run commands on the BigInsights cluster.

Take a look at the [build.gradle](./build.gradle) file, starting with the Example task defintion `task('ExamplePush') { ... }`  and then move on to the spark script [export_to_elasticsearch.py](./export_to_elasticsearch.py) to see exactly what is being done.

##### Example Pull from Elasticsearch

This example uses the previous example to creates some example data and saves it to the user's elasicsearch server.  Next this data is retrieved from Elasticsearch and saved to HDFS.  This example is run by gradle and uses ssh to run commands on the BigInsights cluster.

Take a look at the [build.gradle](./build.gradle) file, starting with the Example task defintion `task('ExamplePull') { ... }`  and then move on to the spark script [import_from_elasticsearch.py](./import_from_elasticsearch.py) to see exactly what is being done.

##### Test environment

This example was created and tested on a [Compose](https://compose.io/) Elasticsearch cluster, by:

- Create Elasticsearch deployment
- In the deployment, create a user
- In the Overview page in your Compose dashboard, note the hostname and port from one of the HTTP connection urls.
- Add the hostname, port, username and password to your connection.properties file


*********************************************************************
#### Instructions

Ensure you have followed the Setup Instructions on the [project home page README](https://github.com/snowch/biginsight-examples), then edit your connection.properties file so that it has the following properties that point to your Elasticsearch server:

```
################################################################################
# Elasticsearch Integration Example : elasticsearch host details
################################################################################

elasticsearch_host:changeme
elasticsearch_port:changeme
elasticsearch_user:changeme
elasticsearch_pass:changeme
```

Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew ExamplePush
../../gradlew ExamplePull
```

- on Windows using:

```
../../gradlew.bat ExamplePush
../../gradlew.bat ExamplePull
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/ElasticSearchIntegrationWithSpark ExamplePush
./gradlew -p examples/ElasticSearchIntegrationWithSpark ExamplePull
```
*********************************************************************
