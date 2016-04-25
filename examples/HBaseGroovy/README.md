Run this example by changing into the current directory then executing:

- on *nix using:

```
../../gradlew Connect
../../gradlew ManipulateSchemaAndPerformCRUD
```

- on Windows using:

```
../../gradlew.bat Connect
../../gradlew.bat ManipulateSchemaAndPerformCRUD
```

*********************************************************************

Note: you can run this script from the top level project folder using the gradle `-p` argument:

```
./gradlew -p examples/HBaseGroovy Connect
./gradlew -p examples/HBaseGroovy ManipulateSchemaAndPerformCRUD
```

*********************************************************************

## Debugging

Switch on HTTP trace debugging with:
```
../../gradlew Connect -PdebugExample
```
