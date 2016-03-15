
if (!dir.exists('./lib')) {

    # create directory to hold libraries
    dir.create('./lib')

    # install libraries
    install.packages('rJava', repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)
    install.packages('base64enc', repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)
    install.packages('data.table', repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)

    # The BigR package is downloaded for you by the build.gradle script
    install.packages('bigr.tar.gz', type="source", repos=NULL, lib='./lib', quiet=FALSE)
}

hostname <- Sys.getenv("hostname")
username <- Sys.getenv("username")
password <- Sys.getenv("password")

print(hostname)

library(bigr)
bigr.connect(host=hostname, user=username, password=password)

# FIXME: we should probaby connect using SSL
# 
# 1. Need to add the certificate alongside connection.properties
# 2. Need this automating:
#
# keytool -import -trustcacerts -alias biginsights -file  ../../ehaasp-10451-mastermanager.bi.services.bluemix.net -keystore ./truststore.jks -storepass mypassword -noprompt
#
# bigr.connect(
#     host=hostname, 
#     user=username,
#     password=password,
#     ssl = TRUE,
#     trustStorePath = "./truststore.jks",
#     trustStorePassword = "mypassword2",
#     keyManager = "SunX509"
#     )

is.bigr.connected()  
