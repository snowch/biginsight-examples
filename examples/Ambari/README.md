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
./gradlew -p examples/Hive Example
```

*********************************************************************

### Note:

You need to have admin ambari role to be able to run service check.

You can run individual example via:

```
../../gradlew ListService
```

ServiceCheck will check HDFS by default. You can check other services with -Pservice=name. For Example:

```
../../gradlew ServiceCheck -Pservice=YARN
```

