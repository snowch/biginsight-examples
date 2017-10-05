*********************************************************************
### README 

*********************************************************************

**NOTE: the examples in this repository are being migrated to https://github.com/IBM-Bluemix/BigInsights-on-Apache-Hadoop.  Please head over to that URL to see if the example you wish to try has been migrated.**

*********************************************************************

This repository contains example projects to help you quickly get started with BigInsights. Following the steps below on your client machine, it should take you less than 5 minutes to run any of the example projects against a BigInsights cluster. The projects are tested on BigInsights on Cloud (bluemix) but they should also work for BigInsights on-premise.

The core idea is that you can run an example project to see it working against your BigInsights cluster. You can then copy the project and adapt it to add your own custom logic.  Think of the example projects as working blueprints.  A design decision was taken that the build scripts should be as independent as possible to allow developers to take a standalone example script project and reuse it with minimal effort.

See the 5 minute demo at the end of the README to watch an example of setting up the biginsight-examples project and then run 'ls /' on the cluster using the Knox webHdfs API.

Also see [this repository](https://github.com/snowch/bluemix-spark-submit/blob/master/README.md) for example projects for Apache Spark on Bluemix.

*********************************************************************

### Pre-requisites

#### Mandatory

- A BigInsights cluster
- Java 8 JDK installed on your local machine
- Git client installed on your local macine
- You are comfortable running commands in the terminal or console

#### Optional

- Cloudant account details (e.g. Free tier on Bluemix)
- dashDB account details (e.g. Free tier on Bluemix)
- Objectstore container details (e.g. Free tier on Bluemix)
- Elasticsearch cluster (e.g. Free trial on Compose.io)

NOTE: You do NOT need to install gradle, the gradlew scripts mentioned below will install gradle for you

### Setup Instructions

See the [FAQ](./FAQ.md) for common issues and their resolution.

See the 5 minute demo at the end of the README to see these steps in action.

- Clone this repository `git clone https://github.com/IBM-Bluemix/BigInsights-on-Apache-Hadoop`
- Copy `connection.properties_template` to `connection.properties`
- Edit `connection.properties` to add your connection details for BigInsights and other optional services such as dashDB
- In `connection.properties` uncomment the line `# known_hosts:allowAnyHosts`
- Run `./gradlew DownloadCertificate` (unix) `gradlew.bat DownloadCertificate` (windows) to download the ssl certificate - you may want to visually verify this certificate
- Run `./gradlew DownloadLibs` (unix) `gradlew.bat DownloadLibs` (windows) to download libraries from the cluster

Now run the WebHdfsGroovy example to list the folders in hdfs:
- Run `./gradlew -p examples/WebHdfsGroovy Ls` (unix) `gradlew.bat -p examples\WebHdfsGroovy Ls` (windows)
- if you receive errors like 'Could not download XXX' retry a few times

Optional: run tests (this takes approximately 40 mins on my cluster)
- Run `./gradlew test` (unix) `gradlew.bat test` (windows) to run the whole set of examples as a test (detailed output for the tests can be found in the folder `./build/test/`).  
- if you receive errors like 'Could not download XXX' retry a few times

Next, see the section below for details of running an example script.

*********************************************************************
### Running the scripts

After performing the setup steps, here is the output from running the WebHdfsGroovy Ls example to list the files and directories in the hdfs root directory:

```bash
biginsight-examples snowch$ ./gradlew -p examples/WebHdfsGroovy Ls
:compileJava UP-TO-DATE
...

>> [app-logs, apps, biginsights, ibmpacks, iop, mapred, mr-history, secureDir, securedir, tmp, user]

>> Ls test was successful.

BUILD SUCCESSFUL

Total time: 4.899 secs
```

Each example project has a README.md file describing how to run the project.  All of the example projects are available in the [[examples](examples)] folder.

*********************************************************************

### 5 Minute Demo

To watch a 5 Minute Demo setting up the project and running an example, see [here](./DEMO_README.md).

*********************************************************************

### Smoke testing your cluster

The examples can be used to smoke test your cluster.  For more information, see [here](./SMOKETESTING_README.md).


*********************************************************************

### Tips

For some tips using this project, for example with multiple clusters, see [here](./TIPS_README.md).

*********************************************************************

### Contributing

Contributions are welcome.  Please send a pull request or contact me at chris.snow@uk.ibm.com to get involved.
