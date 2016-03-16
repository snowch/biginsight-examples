
# check if lib dir exists
if("./lib" %in% dir() == FALSE) {

    # create directory to hold libraries
    dir.create('./lib')

    # install libraries
    install.packages('rJava',      repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)
    install.packages('base64enc',  repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)
    install.packages('data.table', repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)

    # The BigR package is downloaded for you by the build.gradle script
    install.packages('bigr.tar.gz', type="source", repos=NULL, lib='./lib', quiet=FALSE)
}

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
