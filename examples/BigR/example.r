
libdir   <- Sys.getenv("libdir")
hostname <- Sys.getenv("hostname")
username <- Sys.getenv("username")
password <- Sys.getenv("password")

.libPaths(libdir)

library(bigr)

# truststore is created by the build.gradle script

bigr.connect(
    host = hostname, 
    user = username,
    password = password,
    ssl = TRUE,
    trustStorePath = "./truststore.jks",
    trustStorePassword = "mypassword",
    keyManager = "SunX509"
    )

is.bigr.connected()  

print(">> Connectivity test was successful.")
