.libPaths('lib')

hostname <- Sys.getenv("hostname")
username <- Sys.getenv("username")
password <- Sys.getenv("password")

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
