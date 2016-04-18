### Overview

These examples uses curl to perform operations on the cluster using WebHdfs. The examples are:

- Perform 'ls' on the top level folder [Ls](./Ls.sh)
- Create a directory [Mkdir](./Mkdir.sh)
- Upload a file [Put](./Put.sh)

The examples uses a gradle build file [./build.gradle](./build.gradle) to set environment variables for the scripts and to execute the scripts.

Why use curl for the examples?  Developers can replicae what is being done by curl in the language of their own choice using the REST / JSON libraries they prefer for that language.  Note that JVM based developers will probably want to use the knox library - see the other examples here: https://github.com/snowch/biginsight-examples/tree/master/examples#hdfs-using-knox-api---webhdfs


*********************************************************************

### Instructions

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
./gradlew -p examples/WebHdfsLs Example
```

*********************************************************************
