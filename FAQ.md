### gradlew: line 2: $'\r': command not found

cygwin users may encounter the following error:

```
$ ../gradlew RunSquirrel
../gradlew: line 2: $'\r': command not found
../gradlew: line 8: $'\r': command not found
../gradlew: line 11: $'\r': command not found
../gradlew: line 14: $'\r': command not found
../gradlew: line 17: $'\r': command not found
../gradlew: line 18: syntax error near unexpected token `$'{\r''
'./gradlew: line 18: `warn ( ) {
```

The solution is to use gradlew.bat, e.g.

```
$ ../gradlew.bat RunSquirrel
```
