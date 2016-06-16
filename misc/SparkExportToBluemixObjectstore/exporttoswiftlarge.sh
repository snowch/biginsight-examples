#!/bin/bash

# abort on any errors
set -e

# require all variables to be declared
set -u

# add debug output
set -o verbose

################################################################################

# BigInsights cluster username
USER=

# BigInsights cluster hostname
HOST=

### OBJECT STORE CREDENTIALS ###

# project_id
objectstore_tenant=

# user_id
objectstore_username=

# password
objectstore_password=''

# region
objectstore_region=

# don't change these
objectstore_auth_url=https://identity.open.softlayer.com/v3/auth/tokens
objectstore_auth_method=keystoneV3

# create a new container each time we run so we don't get an error that
# the container already exists
objectstore_container=$(date +%s)

################################################################################

# ssh url
URL=${USER}@${HOST}

# directory on the cluster where we will upload LICENSE and spark script
UNIXDIR=/home/${USER}/swift_export

# directory in hdfs where we will upload the LICENSE file
HDFSDIR=/user/${USER}/swift_export

# Copy your ssh public key to the server to enable secure passwordless ssh
ssh-copy-id ${USER}@${HOST}

# update kerberos tokens
ssh ${URL} "kinit -k -t ${USER}.keytab ${USER}@IBM.COM"

# create a directory on the cluster for our spark script if required
ssh ${URL} "[ -d ${UNIXDIR} ] || mkdir ${UNIXDIR}"

# copy our script to the cluster
scp exporttoswiftlarge.py ${URL}:${UNIXDIR}/

for i in $(seq 1 12);
do
    MONTH=$(printf '%02d' $i)

    ssh ${URL} "[ -f ${UNIXDIR}/green_tripdata_2014-${MONTH}.csv ] || curl https://storage.googleapis.com/tlc-trip-data/2014/green_tripdata_2014-${MONTH}.csv | sed -e '1d' > ${UNIXDIR}/green_tripdata_2014-${MONTH}.csv"

    ssh ${URL} "[ -f ${UNIXDIR}/green_tripdata_2015-${MONTH}.csv ] || curl https://storage.googleapis.com/tlc-trip-data/2015/green_tripdata_2015-${MONTH}.csv | sed -e '1d' > ${UNIXDIR}/green_tripdata_2015-${MONTH}.csv"
done

ssh ${URL} "cd ${UNIXDIR} && cat green_tripdata_201?-??.csv > green_tripdata.csv"

# create a directory in hdfs for spark
ssh ${URL} "hadoop fs -test -d ${HDFSDIR} || hadoop fs -mkdir ${HDFSDIR}"

# add the data to hdfs
ssh ${URL} "hadoop fs -put -f ${UNIXDIR}/green_tripdata.csv ${HDFSDIR}/green_tripdata.csv"

# run the spark script
ssh ${URL} pyspark  \
    --packages com.ibm.stocator:stocator:1.0.3,com.databricks:spark-csv_2.11:1.4.0 \
    ${UNIXDIR}/exporttoswiftlarge.py \
    ${HDFSDIR}/green_tripdata.csv \
    "'${objectstore_auth_url}'" \
    "'${objectstore_tenant}'" \
    "'${objectstore_username}'" \
    "'${objectstore_password}'" \
    "'${objectstore_region}'" \
    "'${objectstore_auth_method}'" \
    "'${objectstore_container}'"

