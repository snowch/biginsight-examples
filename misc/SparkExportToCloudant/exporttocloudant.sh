#!/bin/bash

# abort on any errors
set -e

# require all variables to be declared
set -u

# add debug output
set -o verbose

# get the credentials
source exporttocloudant.properties

# ssh url
URL=${USER}@${HOST}

# directory on the cluster where we will download datafiles from the internet
UNIXDIR=/home/${USER}/cloudant_export

# directory in hdfs where we will upload the datafiles
HDFSDIR=/user/${USER}/cloudant_export

# Copy your ssh public key to the server to enable secure passwordless ssh
ssh-copy-id ${USER}@${HOST}

# update kerberos tokens
ssh ${URL} "kinit -k -t ${USER}.keytab ${USER}@IBM.COM"

# create a directory on the cluster for our spark script if required
ssh ${URL} "[ -d ${UNIXDIR} ] || mkdir ${UNIXDIR}"

# copy our script to the cluster
scp exporttocloudant.py ${URL}:${UNIXDIR}/

ssh ${URL} "[ -f ${UNIXDIR}/data_berka.zip ] || " \
           "curl http://sorry.vse.cz/~berka/challenge/pkdd1999/data_berka.zip | unzip -d ."

# create a directory in hdfs for spark
ssh ${URL} "hadoop fs -test -d ${HDFSDIR} || hadoop fs -mkdir ${HDFSDIR}"

# add the data to hdfs
# ssh ${URL} "hadoop fs -put -f ${UNIXDIR}/green_tripdata.csv ${HDFSDIR}/green_tripdata.csv"

# run the spark script
#ssh ${URL} pyspark  \
#    --packages com.ibm.stocator:stocator:1.0.3,com.databricks:spark-csv_2.11:1.4.0 \
#    ${UNIXDIR}/exporttoswiftlarge.py \
#    ${HDFSDIR}/green_tripdata.csv \
#    "'${objectstore_auth_url}'" \
#    "'${objectstore_tenant}'" \
#    "'${objectstore_username}'" \
#    "'${objectstore_password}'" \
#    "'${objectstore_region}'" \
#    "'${objectstore_auth_method}'" \
#    "'${objectstore_container}'"

