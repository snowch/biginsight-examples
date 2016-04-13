/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import org.apache.hadoop.gateway.shell.Hadoop
import org.apache.hadoop.gateway.shell.hbase.HBase

import static java.util.concurrent.TimeUnit.SECONDS

def env = System.getenv()
def session = Hadoop.login( env.gateway, env.username, env.password )

def systemVersionFuture = HBase.session(session).systemVersion().later()
def clusterVersionFuture = HBase.session(session).clusterVersion().later()
def clusterStatusFuture = HBase.session(session).status().later()

// execute the three requests in parallel
try {
    session.waitFor(
                60, SECONDS, 
                systemVersionFuture,
                clusterVersionFuture,
                clusterStatusFuture
                )
} catch (Exception e) {
    e.printStackTrace()
    System.exit(1)
}

[ systemVersionFuture, clusterVersionFuture, clusterStatusFuture ].each { future ->
    if (future.statusCode != 200) {
        System.err.println "**** Received HTTP ${future.get().statusCode} from API"
        System.exit(1)
    }
    println future.get().string
}

session.shutdown()
