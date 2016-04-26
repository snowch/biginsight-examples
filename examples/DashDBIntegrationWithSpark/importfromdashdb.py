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

import sys
from operator import add

from pyspark import SparkContext
from pyspark.sql import SQLContext

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: importfromdashdb <dash jdbc url> <hdfs filename>", file=sys.stderr)
        exit(-1)

    dashdb_jdbc_url = sys.argv[1]
    hdfs_filename = sys.argv[2]

    sc = SparkContext(appName="Cloudant data pull")

    sqlContext = SQLContext(sc)

    dashdata = sqlContext.read.format('jdbc').options(url=dashdb_jdbc_url, dbtable='SAMPLES.LANGUAGE').load()

    dashdata.rdd.saveAsTextFile(hdfs_filename)

    print("SAMPLES.LANGUAGE data from DashDB saved to hdfs {0}".format(hdfs_filename))

    sc.stop()
