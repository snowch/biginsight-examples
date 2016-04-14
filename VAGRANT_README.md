*********************************************************************

### Vagrant

I use vagrant to test some of the scripts on a pristine environment in an automated fashion.  Vagrant users can simply run `vagrant up` from their client machine after cloning this project and creating their `connection.properties` and `certificate` files:

Note: if you don't have DNS for your cloud cluster (e.g QA cluster), you can add following lines to the vagrant script.

sudo sh -c 'echo "123.45.678.910  mycloudqa-123-mastermanager.bi.services.us-south.bluemix.net mycloudqa-123-mastermanager" >> /etc/hosts'
sudo sh -c 'echo "123.45.678.911  mycloudqa-123-master-1.bi.services.us-south.bluemix.net mycloudqa-123-master-1" >> /etc/hosts'

```
snowch$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider..
==> default: Importing base box 'ubuntu/trusty64'...
...
... [output omitted for brevity]
...
:baseTest
Running base tests
Running ./examples/WebHdfsLs
Running ./examples/WebHdfsMkdir
Running ./examples/WebHdfsPut
Running ./examples/Hive
Running ./examples/HiveJava
Running ./examples/SparkPythonSsh
Running ./examples/CloudantPullWithSpark
Running ./examples/CloudantPushWithSpark
Running ./examples/DashDBPullWithSpark
Skipping interactive example ./examples/HiveBeeline
Skipping interactive example ./examples/Knoxshell
Skipping broken example ./examples/Hbase
Skipping broken example ./examples/HBaseJava
Skipping broken example ./examples/OozieWorkflowMapReduce
:xTest
Running BigX tests
Running ./examples/BigR
Running ./examples/BigSQL
Running ./examples/BigSQLJava
:test
Finished running tests

BUILD SUCCESSFUL
```

*********************************************************************
