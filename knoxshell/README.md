### Running the Knox shell

The Knox shell allows connects to your cluster and allows you to run commands against the cluster using a groovy API.

Run the knox shell from the current folder with:

```../gradlew -q --no-daemon shell```

The shell logs in to the BigInsights cluster and saves the session in the variable `session` 

### Example knox shell session

This example lists all files and folders on the cluster in the '/' folder.

```
groovy:000> json = Hdfs.ls(session).dir('/').now().string
groovy:000> files = slurper.parseText(json).FileStatuses.FileStatus.pathSuffix

===> [app-logs, apps, ... ]
```

See https://knox.apache.org/books/knox-0-6-0/user-guide.html#Service+Details for more knox commands.

TODO: add example Knox scripts for:

- uploading files from local folder to the cluster
- downloading files from cluster to local machine
- what else?
