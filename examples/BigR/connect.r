################################################################################
# environment variables
################################################################################
libdir   <- Sys.getenv("libdir")
hostname <- Sys.getenv("hostname")
username <- Sys.getenv("username")
password <- Sys.getenv("password")
projdir  <- Sys.getenv("projdir")
debug    <- Sys.getenv("debug")
################################################################################

.libPaths(libdir)

library(rJava)
.jinit()
print(paste(">> .jclassPath() ", .jclassPath()))

library(bigr)
bigr:::bigr.debug(toupper(debug))

# truststore is created by the build.gradle script

connected <- bigr.connect(
    host = hostname, 
    user = username,
    password = password,
    ssl = TRUE,
    trustStorePath = paste(projdir, "/truststore.jks", sep=""),
    trustStorePassword = "mypassword",
    keyManager = "SunX509"
    )

if (connected) {
    print("Successfully connected to BigR")
}
