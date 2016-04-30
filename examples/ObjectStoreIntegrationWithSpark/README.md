#### Overview

This example extends the [SparkPythonSsh](../SparkPythonSsh) example with two further examples using Spark and the  [Stocator](https://github.com/SparkTC/stocator) spark library to:

- upload the table of wordcounts from the LICENSE file to an object store container
- download the wordcounts in an object store container to HDFS

The [build.gradle](./build.gradle) script contains two main tasks for the above behavior, with task names 'ExamplePush' and 'ExamplePull'.  Inspect these tasks for details.

*********************************************************************
#### Instructions

Ensure you have followed the Setup Instructions on the [project home page README](https://github.com/snowch/biginsight-examples), then edit your connection.properties file so that it has the following properties that point to your Objectstore container:

```bash
### auth url ###

# SoftLayer Dallas    > E.g. https://dal05.objectstorage.softlayer.net/auth/v1.0/
# Bluemix Keystone V3 > https://identity.open.softlayer.com/v3/auth/tokens
objectstore_auth_url:https://identity.open.softlayer.com/v3/auth/tokens

### tenant ###

# Bluemix Keystone V3 > use project_id
objectstore_tenant:changeme

### username ###

# SoftLayer Dallas    > username
# Bluemix Keystone V3 > user_id
objectstore_username:changeme

### password ###

# SoftLayer Dallas    > API key
# Bluemix Keystone V3 > Password
objectstore_password:changeme

### region ###

# SoftLayer Dallas    > E.g. dal05
# Bluemix Keystone V3 > dallas
objectstore_region:dallas

### auth method ###

# SoftLayer Dallas    > swiftauth
# Bluemix Keystone V3 > keystoneV3
objectstore_auth_method:keystoneV3

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
./gradlew -p examples/ObjectStoreIntegrationWithSwift ExamplePush
./gradlew -p examples/ObjectStoreIntegrationWithSwift ExamplePull
```

*********************************************************************

