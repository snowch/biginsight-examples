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

## Failed to create MD5 hash for file

```
$ ../gradlew.bat RunSquirrel
...
* What went wrong:
Failed to capture snapshot of output files for task 'DownloadSquirrel' during up
-to-date check.  See stacktrace for details.
> Failed to create MD5 hash for file C:\Users\IBM_ADMIN\Documents\GitHub\github2
\biginsight-examples\examples\SquirrelSQL\.gradle\2.9\taskArtifacts\cache.proper
ties.lock.
```
The solution is to set the `--project-cache-dir` argument, e.g.

```
$ ../gradlew.bat --project-cache-dir ../ RunSquirrel
```
