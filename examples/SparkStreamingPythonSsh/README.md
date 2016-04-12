#### Overview

This example demonstrates a spark streaming job on the BigInsights cluster.

The [./build.gradle](./build.gradle) script does all the work using a ssh plugin to:

- using scp, copy [./sparkstreaming.py](./sparkstreaming.py) to the BigInsights cluster
- using scp, copy [./wordsocket.py](./wordsocket.py) to the BigInsights cluster
- run the wordsocket.py script on the cluster which sends random words to a client connected to the TCP socket 
- run the spark job to perform a word count on the workds received from the socket every second
- after 30 seconds the spark job terminates

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

You may see an exception `SparkContext has been shutdown` at the end of the script - this can be ignored.

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/SparkStreamingPythonSsh Example
```
