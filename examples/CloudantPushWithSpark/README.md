#### Overview

This example shows how to execute the spark wordcount example script [1] on the BigInsights cluster.  The wordcount is performed on an Apache 2 License file.

The [./build.gradle](./build.gradle) script does all the work using a ssh plugin to:

- using scp, copy [./wordcount.py](./wordcount.py) and [./LICENSE](./LICENSE) files to the BigInsights cluster
- from the ssh session, use the `hadoop fs` command to add the LICENSE to hdfs
- from the ssh session, execute the wordcount.py script with the `pyspark` command.

Output from the command will contain the wordcounts:

```
...
bicluster#54|: 1136
bicluster#54|limited: 4
bicluster#54|all: 3
bicluster#54|code: 1
bicluster#54|managed: 1
bicluster#54|customary: 1
bicluster#54|Works,: 2
bicluster#54|APPENDIX:: 1
...

```
[1] From https://github.com/apache/spark/blob/master/examples/src/main/python/wordcount.py
*********************************************************************
#### Instructions

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
