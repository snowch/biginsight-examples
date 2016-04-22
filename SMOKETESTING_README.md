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

