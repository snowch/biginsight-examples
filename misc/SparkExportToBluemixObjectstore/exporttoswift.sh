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
objectstore_password=

# region
objectstore_region=

# don't change these
objectstore_auth_url=
objectstore_auth_method=

# create a new container each time we run so we don't get an error that
# the container already exists
objectstore_container=$(date +%s)

################################################################################

# ssh url
URL=${USER}@${HOST}

# Copy your ssh public key to the server to enable secure passwordless ssh
ssh-copy-id ${USER}@${HOST}

# update kerberos tokens
ssh $URL kinit -k -t ${USER}.keytab ${USER}@IBM.COM

# create a directory on the cluster for our spark script if required
ssh $URL [ -d /home/${USER}/swift_export ] || mkdir /home/${USER}/swift_export

# copy our script to the cluster
scp exporttoswift.py $URL:/home/${USER}/swift_export/

# copy the LICENSE file we want to word count
scp LICENSE $URL:/home/${USER}/swift_export/

# create a directory in hdfs for spark
ssh $URL hadoop fs -test -d /user/${USER}/swift_export || hadoop fs -mkdir /user/${USER}/swift_export

# add the LICENSE file to hdfs
ssh $URL hadoop fs -put -f /home/${USER}/swift_export/LICENSE /user/${USER}/LICENSE

# run the spark script
ssh $URL pyspark  --packages com.ibm.stocator:stocator:1.0.3 \
    /home/${USER}/swift_export/exporttoswift.py \
    /user/${USER}/LICENSE \
    "${objectstore_auth_url}" \
    "${objectstore_tenant}" \
    "${objectstore_username}" \
    "${objectstore_password}" \
    "${objectstore_region}" \
    "${objectstore_auth_method}" \
    "${objectstore_container}"

