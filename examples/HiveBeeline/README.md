### Overview

This example runs a hive beeline shell preconfigured with to connect to your BigInsights environment.

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
Connecting to jdbc:hive2://ehaasp-10451-master-2.bi.services.bluemix.net:10000/default;ssl=true;sslTrustStore=/Users/snowch/Repos/biginsight-examples/examples/HiveBeeline/truststore.jks;
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/Users/snowch/.gradle/caches/modules-2/files-2.1/org.apache.logging.log4j/log4j-slf4j-impl/2.4.1/1153bec315f388b2635c25cf97105ae9dce61b58/log4j-slf4j-impl-2.4.1.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/Users/snowch/.gradle/caches/modules-2/files-2.1/ch.qos.logback/logback-classic/1.0.9/258c3d8f956e7c8723f13fdea6b81e3d74201f68/logback-classic-1.0.9.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/Users/snowch/.gradle/caches/modules-2/files-2.1/org.slf4j/slf4j-log4j12/1.7.5/6edffc576ce104ec769d954618764f39f0f0f10d/slf4j-log4j12-1.7.5.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]
ERROR StatusLogger No log4j2 configuration file found. Using default configuration: logging only errors to the console.
Connected to: Apache Hive (version 1.2.1-IBM-12)
Driver: Hive JDBC (version 2.0.0)
Transaction isolation: TRANSACTION_REPEATABLE_READ
Beeline version 2.0.0 by Apache Hive
0: jdbc:hive2://ehaasp-10451-master-2.bi.serv> show tables;
```

