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

if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: exporttoswift <project id> <username> <password> <service> <container>", file=sys.stderr)
        exit(-1)

    project_id   = sys.argv[1]
    username     = sys.argv[2]
    password     = sys.argv[3]
    service_name = sys.argv[4]
    container    = sys.argv[5]

    sc = SparkContext()

    prefix = "fs.swift2d.service" + service_name

    sc.hadoopConfiguration.set(prefix + ".auth.url","https://identity.open.softlayer.com/v3/auth/tokens")
    sc.hadoopConfiguration.set(prefix + ".public", "true")
    sc.hadoopConfiguration.set(prefix + ".tenant", project_id)
    sc.hadoopConfiguration.set(prefix + ".password", password)
    sc.hadoopConfiguration.set(prefix + ".username", username)
    sc.hadoopConfiguration.set(prefix + ".auth.method", "keystoneV3")
    sc.hadoopConfiguration.set(prefix + ".region", "dallas")

    distData = sc.parallelize([1,2,3,4,5])
    distData.saveAsTextFile("swift2d://{0}.{1}/one1.txt".format(container, service_name))

    sc.stop()
