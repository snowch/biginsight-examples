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
from pyspark import SparkConf
from pyspark.sql import SQLContext

if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: export_to_elasticsearch.py <host> <port> <user> <pass> <tmpdir>", file=sys.stderr)
        exit(-1)

    host     = sys.argv[1]
    port     = sys.argv[2]
    user     = sys.argv[3]
    password = sys.argv[4]
    tmpDir   = sys.argv[5]

    conf = SparkConf().setAppName("Elasticsearch example")

    # see https://www.elastic.co/guide/en/elasticsearch/hadoop/current/configuration.html
    conf.set("es.nodes",host)
    conf.set("es.port",str(port))
    conf.set("es.net.http.auth.user",user)
    conf.set("es.net.http.auth.pass",password)
    conf.set("es.net.ssl","true")
    conf.set("es.net.ssl.truststore.location","truststore.jks")
    conf.set("es.net.ssl.truststore.pass","mypassword")
    conf.set("es.net.ssl.cert.allow.self.signed","true")
    conf.set("es.nodes.wan.only","true")


    sc = SparkContext(conf=conf)
    sqlContext = SQLContext(sc)

    d = [{'name': 'Alice', 'age': 1}]
    df = sqlContext.createDataFrame(d)

    df.write.format("org.elasticsearch.spark.sql").save("spark/{0}".format(tmpDir))

    sc.stop()
