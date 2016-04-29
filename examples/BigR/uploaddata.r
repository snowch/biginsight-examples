projdir <- Sys.getenv("projdir")

# connect.r will open the connection to the cluster
source( paste( projdir, "/connect.r", sep="" ) )

#################
# 1. Data loading
#################

# In order to try out any example, first run the following steps to upload
# the aforementioned dataset to a BigInsights cluster.

airfile <- system.file("extdata", "airline.zip", package="bigr")
airfile <- unzip(airfile, exdir = tempdir())
airR <- read.csv(airfile, stringsAsFactors=F)

# TODO: use a randomly generate name for the csv - we don't want to clobber someone elase's data.

# Upload the data to the BigInsights server. This may take 15-20 seconds
air <- as.bigr.frame(airR)
air <- bigr.persist(air, dataSource="DEL", 
                         dataPath="/user/bigr/examples/airline_demo.csv",
                         header=T, delimiter=",", useMapReduce=F)

###########################
# 2. Accessing data on HDFS
###########################

# Once uploaded, one merely needs to instantiate a big.frame object,
# commonly referenced as "air" in the examples, to access the dataset via
# the Big R API.
air_hdfs <- bigr.frame(dataPath = "/user/bigr/examples/airline_demo.csv",
                  dataSource = "DEL",
                  delimiter=",", header = T,
                  coltypes = ifelse(1:29 %in% c(9,11,17,18,23), "character", "integer"),
                  useMapReduce = T)

air_hdfs_rows <- nrow(air_hdfs)

# verify we have saved some data to hdfs
if (air_hdfs_rows != 128790) {
    stop(paste("Expecting ", 128790, " rows, but found ", air_hdfs_rows, sep=""))
}

# clean up any changes this script has made
bigr.rmfs("/user/bigr/examples/airline_demo.csv", force = F, recursive = T)
