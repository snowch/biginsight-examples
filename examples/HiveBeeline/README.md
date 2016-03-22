### Overview

This example runs a hive beeline shell preconfigured to connect to your BigInsights environment.

*********************************************************************

### Instructions

Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew -q Example
```

- on Windows using:

```
../../gradlew.bat -q Example
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/HiveBeeline -q Example
```

*********************************************************************

### Example session

```
snowch$ ../../gradlew -q clean Example
[ant:exec] Result: 1
Connecting to jdbc:hive2://ehaasp-12345-master-2.bi.services.bluemix.net:10000/default;ssl=true;sslTrustStore=/Users/snowch/Repos/biginsight-examples/examples/HiveBeeline/truststore.jks;
...
Connected to: Apache Hive (version 1.2.1-IBM-12)
Driver: Hive JDBC (version 2.0.0)
Transaction isolation: TRANSACTION_REPEATABLE_READ
Beeline version 2.0.0 by Apache Hive
0: jdbc:hive2://ehaasp-12345-master-2.bi.serv> show tables;
+-----------------------------+--+
|          tab_name           |
+-----------------------------+--+
| biadmin_temp_1458143087097  |
| biadmin_temp_1458143173488  |
| biadmin_temp_1458143216618  |
+-----------------------------+--+
3 rows selected (0.217 seconds)
0: jdbc:hive2://ehaasp-12345-master-2.bi.serv>
```

