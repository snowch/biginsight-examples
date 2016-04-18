### Overview

This example uses the Knox client librray to initiate a session on the BigInsights cluster and perform:

 - `ls` on the top level folder `/` [Ls.groovy](./Ls.groovy)
 - `mkdir` operation [Mkdir.groovy](./Mkdir.groovy)
 - upload a file [Put.groovy](./Put.groovy)

The example uses a gradle build file [./build.gradle](./build.gradle) to retrieve the knox client libraries, set up a groovy session and execute the groovy scripts.

For some other examples of Knox scripts, see the section [More Info](#more-info), below.

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

### More info

Here are some other examples of the knox API taken from the Knox [online documentation](http://knox.apache.org/books/knox-0-6-0/user-guide.html#WebHDFS):

```groovy
// Import the client DSL and a useful utilities for working with JSON.
import org.apache.hadoop.gateway.shell.Hadoop
import org.apache.hadoop.gateway.shell.hdfs.Hdfs
import groovy.json.JsonSlurper

// Setup some basic config.
gateway = "https://localhost:8443/gateway/sandbox"
username = "guest"
password = "guest-password"

// Start the session.
session = Hadoop.login( gateway, username, password )

// Cleanup anything leftover from a previous run.
Hdfs.rm( session ).file( "/user/guest/example" ).recursive().now()

// Upload the README to HDFS.
Hdfs.put( session ).file( "README" ).to( "/user/guest/example/README" ).now()

// Download the README from HDFS.
text = Hdfs.get( session ).from( "/user/guest/example/README" ).now().string
println text

// List the contents of the directory.
text = Hdfs.ls( session ).dir( "/user/guest/example" ).now().string
json = (new JsonSlurper()).parseText( text )
println json.FileStatuses.FileStatus.pathSuffix

// Cleanup the directory.
Hdfs.rm( session ).file( "/user/guest/example" ).recursive().now()

// Clean the session.
session.shutdown()
```
