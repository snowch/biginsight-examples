
if (!dir.exists('./lib')) {

    # create directory to hold libraries
    dir.create('./lib')

    # install libraries
    install.packages('rJava', repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)
    install.packages('base64enc', repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)
    install.packages('data.table', repos='http://cran.us.r-project.org', lib='./lib', quiet=FALSE)
    install.packages('bigr.tar.gz', type="source", repos=NULL, lib='./lib', quiet=FALSE)
}

hostname <- Sys.getenv("hostname")
username <- Sys.getenv("username")
password <- Sys.getenv("password")

library(bigr)
bigr.connect(host=hostname, user=username, password=password)
is.bigr.connected()  
