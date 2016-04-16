*********************************************************************
### README
*********************************************************************

This project contains sample scripts  to help you quickly get started with BigInsights. Following the steps below on your client machine, it should take you less than 5 minutes to run any of the example projects against a BigInsights cluster. These scripts are tested on BigInsights on Cloud (bluemix) but they should also work for BigInsights on-premise.

The core idea is that you can run an example project to see it working against your BigInsights cluster. You can then copy the project and adapt it to add your own custom logic.  Think of the example projects as working blueprints.  A design decision was taken that the build scripts should be as independent as possible to allow developers to take a standalone example script project and reuse it with minimal effort.

See the 5 minute demo at the end of the README to watch an example of setting up the biginsight-examples project and then run 'ls /' on the cluster using the Knox webHdfs API.

NOTE: I run these scripts primarily on a Mac OS/X machine.  Please let me know if you have trouble running them on other operating systems.

*********************************************************************

### Pre-requisites

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
- Ssh into the BigInsights cluster 'mastermanager' node to install the cluster's SSL certificate into ./ssh/known_hosts
- Ssh into the BigInsights cluster 'master-2' node to install the cluster's SSL certificate into ./ssh/known_hosts (this step is not required for Basic clusters)
- Run `./gradlew test` (unix) `gradlew.bat test` (windows) to run the whole set of examples as a test

*********************************************************************
### Running the scripts

See the README.md file in each example in the [[examples](examples)] folder for instructions how to run the script.
*********************************************************************

### Quick Links

Running `./gradlew` from the top level folder will print some key links for your cluster, e.g.:

```
$ ./gradlew
--------------------------------------------------------------------------------------------------------------------------------------
                                                       CLUSTER DETAILS
--------------------------------------------------------------------------------------------------------------------------------------
Ambari URL         ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:9443/
BigInsights URL    ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:8443/gateway/default/BigInsightsWeb/index.html
YARN URL           ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:8443/gateway/yarnui/yarn/apps
Master Mgr SSH URL ::      ssh://biadmin@ehaasp-12345-mastermanager.bi.services.bluemix.net
Master 2   SSH URL ::      ssh://biadmin@ehaasp-12345-master-2.bi.services.bluemix.net
--------------------------------------------------------------------------------------------------------------------------------------
```

*********************************************************************

### 5 Minute Demo

Refresh the browser to restart the demo to the beginning.

![Demo](./Overview.gif)

NOTE: the cluster was deleted after recording the demo.

*********************************************************************

### Smoke testing your cluster

Smoke testing can be used to verify that a change in configuration of a software component or service does not break basic functionality.

This project also allows you to smoke test your cluster by running the example projects against your cluster.  You can run the tests after cloning and setting up the project as described here.  After setting up, you can run `./gradlew test` inside the cloned project directory. E.g. 

```
snowch$ ./gradlew test
-----------------------------------------------------------------------------------------------------------------------------
                                                   CLUSTER DETAILS
-----------------------------------------------------------------------------------------------------------------------------
Ambari URL         ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:9443/
BigInsights URL    ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:8443/gateway/default/BigInsightsWeb/index.html
YARN URL           ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:8443/gateway/yarnui/yarn/apps
Master Mgr SSH URL ::      ssh://biadmin@ehaasp-12345-mastermanager.bi.services.bluemix.net
Master 2   SSH URL ::      ssh://biadmin@ehaasp-12345-master-2.bi.services.bluemix.net
-----------------------------------------------------------------------------------------------------------------------------
:baseTest
Running base tests
Test passed  ./examples/WebHdfsLs
Test passed  ./examples/WebHdfsMkdir
Test passed  ./examples/WebHdfsPut
Test passed  ./examples/Hive
Test passed  ./examples/HiveJava
Test passed  ./examples/SparkPythonSsh
Test passed  ./examples/SparkStreamingPythonSsh
Test passed  ./examples/CloudantPullWithSpark
Test passed  ./examples/CloudantPushWithSpark
Test passed  ./examples/DashDBPullWithSpark
Test passed  ./examples/DashDBPushWithSpark
Test failed  ./examples/OozieWorkflowMapReduce
Test failed  ./examples/OozieWorkflowSpark
Test failed  ./examples/OozieWorkflowSparkPython
Test failed  ./examples/WebHCatMapReduce
Test failed  ./examples/WebHCatPig
Test failed  ./examples/WebHCatHive
Test passed  ./examples/HBase
Test passed  ./examples/HBaseJava
Test skipped ./examples/HiveBeeline [interactive examples are not tested]
Test skipped ./examples/Knoxshell [interactive examples are not tested]
:xTest
Running BigX tests
Test passed  ./examples/BigR
Test passed  ./examples/BigSQL
Test passed  ./examples/BigSQLJava
:test
Finished running tests.  *** Test output can be found in '/your_repo_dir/build/test/' ***

BUILD SUCCESSFUL
```

*********************************************************************

### Tips

If you want to use the scripts for multiple clusters, you can create multiple connection.properties and certificate files, e.g

- connection.properties.cluster1, connection.properties.cluster2
- certificate.cluster1, certificate.cluster2

You can set the current cluster on *nix using the `ln` command, e.g

```
# run tests on cluster 1
ln -sf connection.properties.cluster1 connection.properties
ln -sf certificate.cluster1 certificate
./gradlew test

# run tests on cluster 2
ln -sf connection.properties.cluster2 connection.properties
ln -sf certificate.cluster2 certificate
./gradlew test
```

*********************************************************************

### Contributing

Contributions are welcome.  Please send a pull request or contact me at chris.snow@uk.ibm.com to get involved.
