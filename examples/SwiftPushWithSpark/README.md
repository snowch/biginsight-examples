#### Overview

This example extends the [SparkPythonSsh](./SparkPythonSsh) example to upload the table of wordcounts to swift object store.


*********************************************************************
#### Instructions

Make sure your connection.properties file has values set to point to the Cloudant account where you want the results saved:

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
../../gradlew Example
```

- on Windows using:

```
../../gradlew.bat Example
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/SwiftPushWithSpark Example
```
