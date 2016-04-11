#### Overview

This example demonstrates a spark streaming job on the BigInsights cluster.

The [./build.gradle](./build.gradle) script does all the work using a ssh plugin to:

- using scp, copy [./sparkstreaming.py](./sparkstreaming.py) to the BigInsights cluster
- using scp, copy [./wordsocket.py](./wordsocket.py) to the BigInsights cluster
- run the wordsocket.py script on the cluster which listens on a TCP socket and sends random words to a connected client 
- run the spark job to perform a word count on the received words every second
- after 30 seconds the spark job terminates

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

Note:  you may see an exception `SparkContext has been shutdown` at the end of the script - this can be ignored

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/SparkPythonSsh Example
```
