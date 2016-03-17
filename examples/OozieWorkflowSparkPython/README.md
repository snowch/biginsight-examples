Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew Example
```

- on Windows using:

```
../../gradlew.bat Example
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/Hive Example
```

*********************************************************************

### Known issues

The documentation for my cluster at https://hostname:8443/gateway/oozieui/oozie/docs/DG_SparkActionExtension.html - suggests that Spark actions are available, however, I receive this error trying to run a spark action:

`java.lang.RuntimeException: java.lang.ClassNotFoundException: Class org.apache.oozie.action.hadoop.SparkMain not found`

spark-assembly.jar is added to the ./lib folder, but on inspection I noticed that spark-assembly.jar does NOT contain a SparkMain class.
