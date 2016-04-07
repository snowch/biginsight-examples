*********************************************************************
### README
*********************************************************************

This project contains sample scripts  to help you quickly get started with BigInsights. Following the steps below on your client machine, it should take you less than 5 minutes to run any of the example projects against a BigInsights cluster. These scripts are tested on BigInsights on Cloud (bluemix) but they should also work for BigInsights on-premise.

The core idea is that you can run an example project to see it working against your BigInsights cluster. You can then copy the project and adapt it to add your own custom logic.  Think of the example projects as working blueprints.  A design decision was taken that the build scripts should be as independent as possible to allow developers to take a standalone example script project and reuse it with minimal effort.

See the 5 minute demo at the end of the README to watch an example of setting up the biginsight-examples project and then run 'ls /' on the cluster using the Knox webHdfs API.

*********************************************************************

### Pre-requisites

- Java 7 or 8 installed and JAVA_HOME environment variable set
- You do NOT need to install gradle, the gradlew scripts will setup gradle for you


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

### Vagrant

I use vagrant to test some of the scripts on a pristine environment in an automated fashion.  Vagrant users can simply run `vagrant up` from their client machine after cloning this project and creating their `connection.properties` and `certificate` files:

```
snowch$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider..
==> default: Importing base box 'ubuntu/trusty64'...
...
... [output omitted for brevity]
...
==> default: :baseTest
==> default: Running base tests
==> default: Running ./examples/WebHdfsLs
==> default: Running ./examples/WebHdfsMkdir
==> default: Running ./examples/WebHdfsPut
==> default: Running ./examples/HiveJava
==> default: Running ./examples/SparkPythonSsh
==> default: Running ./examples/CloudantPullWithSpark
==> default: Running ./examples/CloudantPushWithSpark
==> default: Running ./examples/DashDBPullWithSpark
==> default: :xTest
==> default: Running BigX tests
==> default: Running ./examples/BigR
==> default: Running ./examples/BigSQL
==> default: Running ./examples/BigSQLJava
==> default: :test
==> default: Finished running tests
==> default: BUILD SUCCESSFUL
```

*********************************************************************

### Contributing

Contributions are welcome.  Please send a pull request or contact me at chris.snow@uk.ibm.com to get involved.
