#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

from __future__ import print_function

import time
import sys
from operator import add

from pyspark import SparkContext
from pyspark.sql import SQLContext

# create a Cloudant database using httplib
# httplib is used because other libraries aren't available on BigInsights by default
# This code will be made redundant by: https://github.com/cloudant-labs/spark-cloudant/pull/59/commits/01234e09cf71faca82b8dcaf67cb423c3206ad8c
def createDatabase(hostname, username, password, dbname):
    import httplib
    import base64
    import string

    auth = base64.encodestring('%s:%s' % (username, password)).replace('\n', '')
    restservice = httplib.HTTPS(hostname)
    restservice.putrequest("PUT", '/' + dbname)
    restservice.putheader("Host", hostname)
    restservice.putheader("Authorization", "Basic %s" % auth)
    restservice.endheaders()
    restservice.send('')
    statuscode, statusmessage, header = restservice.getreply()

    if statuscode != 201:
        raise Exception(statuscode, stausmessage)

if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: wordcount <file> <cloudant hostname> <cloudant username> <cloudant password> <cloudant database>", file=sys.stderr)
        exit(-1)

    license_filename = sys.argv[1]
    cl_hostname = sys.argv[2]
    cl_username = sys.argv[3]
    cl_password = sys.argv[4]
    cl_database = sys.argv[5]

    createDatabase(cl_hostname, cl_username, cl_password, cl_database)
   
    sc = SparkContext(appName="PythonWordCount")

    # read file from HDFS
    lines = sc.textFile(license_filename, 1)
    counts = lines.flatMap(lambda x: x.split(' ')) \
                  .map(lambda x: (x, 1)) \
                  .reduceByKey(add) \
                  .filter(lambda x: x[0].isalnum())

    sqlContext = SQLContext(sc)

    # Create a sql dataframe from the counts dataframe    
    df = sqlContext.createDataFrame(counts,['letter', 'count'])

    # Let's peek at the schema and some records
    print('*' * 80)
    print(df.printSchema())
    print(df.show(20))
    print('*' * 80)
    
    # Write the data to Cloudant
    df.write.format("com.cloudant.spark") \
        .option("cloudant.host",cl_hostname) \
        .option("cloudant.username",cl_username) \
        .option("cloudant.password",cl_password) \
        .save(cl_database)

    print("Word counts of LICENSE file have been saved to https://{0}/{1}".format(cl_hostname, cl_database))

    sc.stop()
