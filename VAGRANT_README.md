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
