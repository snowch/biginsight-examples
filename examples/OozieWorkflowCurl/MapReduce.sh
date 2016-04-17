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

# disallow undefined variables
set -u

# abort script if any commands return an error
set -e

DIR="/user/${username}/test-$(date +%s)"

INPUT_DIR="${DIR}/input"
OUTPUT_DIR="${DIR}/output"

FILE="LICENSE"

################################################################################

cat << EOF > workflow-definition.xml
<workflow-app xmlns="uri:oozie:workflow:0.2" name="wordcount-workflow">
    <start to="root"/>
    <action name="root">
        <java>
            <job-tracker>\${jobTracker}</job-tracker>
            <name-node>\${nameNode}</name-node>
            <main-class>org.apache.hadoop.examples.WordCount</main-class>
            <arg>\${inputDir}</arg>
            <arg>\${outputDir}</arg>
        </java>
        <ok to="end"/>
        <error to="fail"/>
    </action>
    <kill name="fail">
        <message>Java failed, error message[${wf:errorMessage(wf:lastErrorNode())}]</message>
    </kill>
    <end name="end"/>
</workflow-app>
EOF

################################################################################

cat << EOF > workflow-configuration.xml
<configuration>
    <property>
        <name>jobTracker</name>
        <value>default</value>
        <!--value>REPLACE.JOBTRACKER.RPCHOSTPORT</value-->
        <!-- Example: <value>localhost:50300</value> -->
    </property>
    <property>
        <name>nameNode</name>
        <value>default</value>
        <!--value>hdfs://REPLACE.NAMENODE.RPCHOSTPORT</value-->
        <!-- Example: <value>hdfs://localhost:8020</value> -->
    </property>
    <property>
        <name>oozie.wf.application.path</name>
        <value>${INPUT_DIR}</value>
        <!--value>hdfs://REPLACE.NAMENODE.RPCHOSTPORT/tmp/test</value-->
        <!-- Example: <value>hdfs://localhost:8020/tmp/test</value> -->
    </property>
    <property>
        <name>user.name</name>
        <value>mapred</value>
    </property>
    <property>
        <name>inputDir</name>
        <value>${INPUT_DIR}</value>
    </property>
    <property>
        <name>outputDir</name>
        <value>${OUTPUT_DIR}</value>
    </property>
</configuration>
EOF

################################################################################
# create the temporary directory

curl -s -i -k -u ${username}:${password} -X PUT "${gateway}/webhdfs/v1/${DIR}?op=MKDIRS" | grep 'HTTP/1.1 200 OK'
curl -s -i -k -u ${username}:${password} -X PUT "${gateway}/webhdfs/v1/${INPUT_DIR}?op=MKDIRS" | grep 'HTTP/1.1 200 OK'
curl -s -i -k -u ${username}:${password} -X PUT "${gateway}/webhdfs/v1/${OUTPUT_DIR}?op=MKDIRS" | grep 'HTTP/1.1 200 OK'

################################################################################
# upload workflow.xml

# register the name for the file, and get the location (use tr to strip header CRLF
LOCATION=$(curl -s -i -k -u ${username}:${password} -X PUT "${gateway}/webhdfs/v1/${INPUT_DIR}/workflow.xml?op=CREATE" | tr -d '\r' | sed -En "s/^Location: (.*)$/\1/p")

# cmd to send the file to the location
curl -s -i -k -u ${username}:${password} -T workflow-definition.xml -X PUT ${LOCATION} | grep 'HTTP/1.1 201 Created'

################################################################################
# upload hadoop-examples.jar

# register the name for the file, and get the location (use tr to strip header CRLF
LOCATION=$(curl -s -i -k -u ${username}:${password} -X PUT "${gateway}/webhdfs/v1/${INPUT_DIR}/hadoop-examples.jar?op=CREATE" | tr -d '\r' | sed -En "s/^Location: (.*)$/\1/p")

# cmd to send the file to the location
curl -s -i -k -u ${username}:${password} -T samples/hadoop-examples.jar -X PUT ${LOCATION} | grep 'HTTP/1.1 201 Created'

################################################################################
# upload LICENSE

# register the name for the file, and get the location (use tr to strip header CRLF
LOCATION=$(curl -s -i -k -u ${username}:${password} -X PUT "${gateway}/webhdfs/v1/${INPUT_DIR}/LICENSE?op=CREATE" | tr -d '\r' | sed -En "s/^Location: (.*)$/\1/p")

# cmd to send the file to the location
curl -s -i -k -u ${username}:${password} -T LICENSE -X PUT ${LOCATION} | grep 'HTTP/1.1 201 Created'

################################################################################
# submit job

JOB_ID=$(curl -s -k -u ${username}:${password} -H 'Content-Type:application/xml' -T workflow-configuration.xml -X POST "${gateway}/oozie/v1/jobs?action=start" | tr -d '\r' | sed -En 's/^{"id":"([^"]*)"}$/\1/p')

################################################################################
# get job status

curl -s -i -k -u ${username}:${password} -X GET "${gateway}/oozie/v1/job/${JOB_ID}"

# TODO poll for success with timeout

################################################################################
# list the contents of OUTPUT_DIR
 
# curl -i -k -u guest:guest-password -X GET \
#         'https://localhost:8443/gateway/sandbox/webhdfs/v1/user/guest/example/output?op=LISTSTATUS'

################################################################################
# clean up - remove the temporary directory
curl -s -i -k -u ${username}:${password} -X DELETE "${gateway}/webhdfs/v1/${DIR}?op=DELETE&recursive=true" | grep 'HTTP/1.1 200 OK' 

################################################################################

printf "\n>> MapReduce test was successful.\n\n"
