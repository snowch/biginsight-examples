#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# abort script if any commands return an error
set -e

cat << EOF > zeppelin-0.6.0-bin-all.tgz.md5
62a018ccbcc9bbff254bed3001b31b29  zeppelin-0.6.0-bin-all.tgz
EOF

md5sum -c zeppelin-0.6.0-bin-all.tgz.md5 || wget -q http://www.mirrorservice.org/sites/ftp.apache.org/zeppelin/zeppelin-0.6.0/zeppelin-0.6.0-bin-all.tgz

tar xzf zeppelin-0.6.0-bin-all.tgz

export SPARK_HOME=/usr/iop/current/spark-client
export HADOOP_CONF_DIR=/usr/iop/current/hadoop-client/conf
export SPARK_SUBMIT_OPTIONS=

# SPARK_SUBMIT_OPTIONS - What we set here will depend on what we are planning to give to user as default installation. Check out the ones we have for our installation in zeppelin-env.sh in/home/biadmin/spark-enablement/installs/zepplein-with-r-grp2/conf in our cluster

# You need to also change the server address (zeppelin.server.addr) and server port (zeppelin.server.port) to the address of MMN and 7052 in zeppelin-site.xml (in Zeppelin Home/conf directory). We have only 7052 available in MMN. You can do the same by writing a script.

# After all this steps, the user still needs to go to spark interpreter in the Zeppelin UI and need to change the master to yarn-client to run teh spark jobs spawned by Zeppelin on Yarn. By default it is local. Otherwise you need to go to interpreter.json (in Zeppelin-Home/conf) and change local to yarn-client. But I believe it is better to leave this to user but provide this as a documented recommendation and steps.

# TODO - do we need to run zepplin on a different port for each user so they get their own zeppelin UI?
./zeppelin-0.6.0-bin-all/bin/zeppelin-daemon.sh start

