This example shows how to execute the spark example [wordcount](https://github.com/apache/spark/blob/master/examples/src/main/python/wordcount.py) script on the BigInsights cluster.  The wordcount is performed against the Apache 2 License.

The [build.gradle](./build.gradle) script does all the work using a ssh plugin to:

- using scp copy wordcount.py and LICENSE files to the BigInsights cluster
- from the ssh session, use the `hadoop fs` command to add the LICENSE to hdfs
- from the ssh session, execute the wordcount.py script with the `pyspark` command.

*********************************************************************

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
./gradlew -p examples/SparkPythonSsh Example
```
