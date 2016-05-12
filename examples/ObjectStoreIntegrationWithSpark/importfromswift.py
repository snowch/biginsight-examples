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

import re
import sys
from operator import add

from pyspark import SparkContext
from pyspark.sql import SQLContext

if __name__ == "__main__":
    if len(sys.argv) != 9:
        print("Usage: importfromswift <hdfs dir> <auth url> <tenant> <username> <password> <region> <auth method> <container>", file=sys.stderr)
        exit(-1)

    hdfs_filename    = sys.argv[1]
    os_auth_url      = sys.argv[2]
    os_tenant        = sys.argv[3]
    os_username      = sys.argv[4]
    os_password      = sys.argv[5]
    os_region        = sys.argv[6]
    os_auth_method   = sys.argv[7]
    os_container     = sys.argv[8]

    sc = SparkContext()

    prefix = "fs.swift2d.service." + os_region

    sc._jsc.hadoopConfiguration().set("fs.swift2d.impl","com.ibm.stocator.fs.ObjectStoreFileSystem")

    sc._jsc.hadoopConfiguration().set(prefix + ".auth.url",     os_auth_url)
    sc._jsc.hadoopConfiguration().set(prefix + ".public",       "true")
    sc._jsc.hadoopConfiguration().set(prefix + ".tenant",       os_tenant)
    sc._jsc.hadoopConfiguration().set(prefix + ".username",     os_username)
    sc._jsc.hadoopConfiguration().set(prefix + ".password",     os_password)
    sc._jsc.hadoopConfiguration().set(prefix + ".auth.method",  os_auth_method)

    # Softlayer objectstore
    if (os_auth_method != 'swiftauth'):
        sc._jsc.hadoopConfiguration().set(prefix + ".region",       os_region)

    sqlContext = SQLContext(sc)
    
    # This script loads the data that was uploaded to object store using the script ./exporttoswift.py, e.g.
    
    # counts                                                  04/18/2016 8:21 PM        0 KB
    # counts/_SUCCESS                                         04/18/2016 8:21 PM        0 KB
    # counts/part-00000-attempt_201604181921_0003_m_000000_2  04/18/2016 8:21 PM        6 KB

    swift_file_url = "swift2d://{0}.{1}/counts".format(os_container, os_region)

    # import the data
    imported_data = sc.textFile(swift_file_url)

    # save the imported data to hdfs
    imported_data.saveAsTextFile(hdfs_filename)
    
    sc.stop()
