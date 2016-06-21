libdir   <- Sys.getenv("libdir")
debug    <- Sys.getenv("debug")

quiet=TRUE

if (debug) {
  quiet=FALSE
}

.libPaths(libdir)

# create directory to hold libraries
dir.create(libdir)

# install libraries
install.packages('rJava',      repos='http://cran.us.r-project.org', lib=libdir, quiet=quiet)
install.packages('base64enc',  repos='http://cran.us.r-project.org', lib=libdir, quiet=quiet)
install.packages('data.table', repos='http://cran.us.r-project.org', lib=libdir, quiet=quiet)

# The BigR package is downloaded for you by the build.gradle script
install.packages('bigr.tar.gz', type="source", repos=NULL, lib=libdir, quiet=quiet)

library(rJava)
print(.jclassPath())

