### Overview

This example runs a jsqsh shell preconfigured to connect to your BigInsights environment.

*********************************************************************

### Instructions

Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew -q Example
```

- on Windows using:

```
../../gradlew.bat -q Example
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/Jsqsh -q Example
```

*********************************************************************

### Example session

```bash
$ ../../gradlew -q Example
[ant:exec] Result: 1
Welcome to JSqsh 2.2
Type "\help" for help topics. Using JLine.
1> \connect biginsights
[ehaasp-12345-master-2.bi.services.bluemix.net][biadmin] 1> select * from SYSIBM.SYSDUMMY1;
+---------+
| IBMREQD |
+---------+
| Y       |
+---------+
1 row in results(first row: 0.049s; total: 0.066s)
[ehaasp-12345-master-2.bi.services.bluemix.net][biadmin] 1>
```





