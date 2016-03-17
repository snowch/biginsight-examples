.libPaths('lib')

# create directory to hold libraries
dir.create('./lib')

# install libraries
install.packages('rJava',      repos='http://cran.us.r-project.org', lib='./lib', quiet=TRUE)
install.packages('base64enc',  repos='http://cran.us.r-project.org', lib='./lib', quiet=TRUE)
install.packages('data.table', repos='http://cran.us.r-project.org', lib='./lib', quiet=TRUE)

# The BigR package is downloaded for you by the build.gradle script
install.packages('bigr.tar.gz', type="source", repos=NULL, lib='./lib', quiet=FALSE)

