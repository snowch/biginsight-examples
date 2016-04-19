#### Overview

This example extends the [SparkPythonSsh](./SparkPythonSsh) example with two further examples using Spark and the  [Stocator](https://github.com/SparkTC/stocator) spark library to:

- upload the table of wordcounts from the LICENSE file to an object store container
- download the wordcounts in an object store container to HDFS


*********************************************************************
#### Instructions

Make sure your connection.properties file has values set to point to the bluemix swift account where you want the results saved:

```
# this must be set to the project_id
swift_push_project_id:changeme

# this must be set to the userId on
swift_push_username:changeme

# this must be set to the password
swift_push_password:changeme

# this must be set to the region
swift_push_service_name:changeme
```

See the [setup instructions](https://github.com/snowch/biginsight-examples) for more information on creating the connection.propertie file.

Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew ExamplePush
../../gradlew ExamplePull
```

- on Windows using:

```
../../gradlew.bat ExamplePush
../../gradlew.bat ExamplePull
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/SwiftPushWithSpark ExamplePush
./gradlew -p examples/SwiftPushWithSpark ExamplePull
```
