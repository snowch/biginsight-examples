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

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: importfromcloudant <hdfs filename>", file=sys.stderr)
        exit(-1)

    hdfs_filename = sys.argv[1]

    sc = SparkContext(appName="Cloudant data pull")

    sqlContext = SQLContext(sc)

    # Connect to database 'sales' and read schema using all documents as schema sample size
    cloudantdata = sqlContext.read.format("com.cloudant.spark") \
            .option("cloudant.host","examples.cloudant.com") \
            .option("schemaSampleSize", -1) \
            .load("spark_sales")

    cloudantdata.rdd.saveAsTextFile(hdfs_filename)

    print("Sales data from Cloudant saved to hdfs {0}".format(hdfs_filename))

    sc.stop()
