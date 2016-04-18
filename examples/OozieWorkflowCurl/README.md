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
./gradlew -p examples/OozieMapReduceCurl Example
```

*********************************************************************

### Known issues

When running this against a standard BigInsights on Cloud cluster, the service returns `HTTP/1.1 500 Server Error`.  The script does however work ok on a Basic BigInsights on Cloud cluster.
