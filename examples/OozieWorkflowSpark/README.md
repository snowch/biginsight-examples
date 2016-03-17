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

### Known issues

This script works on 'Analytics for Apache Hadoop', but not on 'BigInsights on Cloud Basic Plan'.  Debug output can be found in https://your-hostname:8443/gateway/yarnui/yarn/apps

