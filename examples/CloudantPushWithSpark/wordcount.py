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
    if len(sys.argv) != 5:
        print("Usage: wordcount <file> <cloudant hostname> <cloudant username> <cloudant password>", file=sys.stderr)
        exit(-1)

    license_filename = sys.argv[1]
    cl_hostname = sys.argv[2]
    cl_username = sys.argv[3]
    cl_password = sys.argv[4]

    # create a unique destination database name for each request
    cl_dbname = 'sparktest_{0}'.format(int(time.time()))

    createDatabase(cl_hostname, cl_username, cl_password, cl_dbname)

    sc = SparkContext(appName="PythonWordCount")

    lines = sc.textFile(license_filename, 1)
    counts = lines.flatMap(lambda x: x.split(' ')) \
                  .map(lambda x: (x, 1)) \
                  .reduceByKey(add)

    sqlContext = SQLContext(sc)

    # Infer the schema
    schemaCounts = sqlContext.inferSchema(counts)

    schemaCounts.write.format("com.cloudant.spark") \
        .option("cloudant.host",cl_hostname) \
        .option("cloudant.username",cl_username) \
        .option("cloudant.password",cl_password) \
        .save(cl_dbname)

    print("license counts saved to {0}".format(cl_dbname))

    sc.stop()
    sqlContext.stop()
