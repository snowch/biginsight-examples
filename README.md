*********************************************************************
### README
*********************************************************************

This project contains sample scripts  to help you quickly get started with BigInsights. Following the steps below on your client machine, it should take you less than 5 minutes to run any of the example projects against a BigInsights cluster. These scripts are tested on BigInsights on Cloud (bluemix) but they should also work for BigInsights on-premise.

The core idea is that you can run an example project to see it working against your BigInsights cluster. You can then copy the project and adapt it to add your own custom logic.  Think of the example projects as working blueprints.  A design decision was taken that the build scripts should be as independent as possible to allow developers to take a standalone example script project and reuse it with minimal effort.

See the 5 minute demo at the end of the README to watch an example of setting up the biginsight-examples project and then run 'ls /' on the cluster using the Knox webHdfs API.

*********************************************************************

### Pre-requisites

- A BigInsights cluster
- Java 8 JDK installed
- Git client installed
- You are comfortable running commands in the terminal or console

NOTE: You do NOT need to install gradle, the gradlew scripts mentioned below will install gradle for you

### Setup Instructions

See the 5 minute demo at the end of the README to see these steps in action.

- Clone this repository `git clone https://github.com/snowch/biginsight-examples.git`
- Copy `connection.properties_template` to `connection.properties`
- Edit `connection.properties` to add your BigInsights instance hostname and credentials
- Export the cluster certificate from your browser. The following steps apply to Firefox:
  - Click the lock icon in your browser's address bar.
  - Click More Information and then View Certificate on the Security page.
  - In the Certificate Viewer, select the Details tab and then click Export.
  - Save the certificate in this folder with the filename `certificate`
- In your `connection.properties` uncomment the line `# known_hosts:allowAnyHosts`
- Run `./gradlew test` (unix) `gradlew.bat test` (windows) to run the whole set of examples as a test (detailed output for the tests can be found in the folder `./build/test/`)

*********************************************************************
### Running the scripts

After performing the setup steps, here is the output from running the WebHdfsGroovy Ls example to list the files and directories in the hdfs root directory:

```bash
snowch$ ./gradlew -p examples/WebHdfsGroovy Ls
:compileJava UP-TO-DATE
:compileGroovy
:processResources UP-TO-DATE
:classes
:Ls
log4j:WARN No appenders could be found for logger (org.apache.http.impl.conn.PoolingClientConnectionManager).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.

>> [app-logs, apps, biginsights, ibmpacks, iop, mapred, mr-history, secureDir, securedir, tmp, user]

>> Ls test was successful.

BUILD SUCCESSFUL

Total time: 4.899 secs
```

See the README.md file in each example in the [[examples](examples)] folder for instructions how to run the script.

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
