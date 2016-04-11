Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew Example
```

- on Windows using:

```
../../gradlew.bat Example
```

For http trace debugging, you can set the flag `-PdebugExample`, E.g

```
../../gradlew Example -PdebugExample
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/Hive Example
```

*********************************************************************

### Known issues

When running this against a standard BigInsights on Cloud cluster, the service returns `HTTP/1.1 500 Server Error`.  The script does however work ok on a Basic BigInsights on Cloud cluster.
