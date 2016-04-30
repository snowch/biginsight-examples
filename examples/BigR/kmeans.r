projdir <- Sys.getenv("projdir")

# connect.r will open the connection to the cluster
source( paste( projdir, "/connect.r", sep="" ) )

##################################################################
# 1. Machine Learning example: building a k-means clustering model
##################################################################

# Remove files from previous executions (if any)
invisible(bigr.rmfs("/user/bigr/examples/iris.* /user/bigr/examples/km*"))

# Load the Iris dataset to HDFS
irisbf <- as.bigr.frame(iris[, -5])

# Convert the Iris dataset into a bigr.matrix object
irisBM <- bigr.transform(bf = irisbf, outData = "/user/bigr/examples/iris.mtx",
                                                  transformPath = "/user/bigr/examples/iris.transform")

# Create a k-means model with 10 clusters
km <- bigr.kmeans(irisBM, centers=10, directory="/user/bigr/examples/km", writeY=T)

# Use the existing model to cluster a different dataset
p <- predict(km, irisBM, "/user/bigr/examples/km.preds")

if (nrow(p$stats) != 9) {
    stop("'p' doesn't appear to be a valid response from predict")
}
