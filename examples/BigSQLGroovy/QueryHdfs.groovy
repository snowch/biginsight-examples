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

import groovy.sql.Sql
import org.apache.hadoop.gateway.shell.Hadoop
import org.apache.hadoop.gateway.shell.hdfs.Hdfs

env = System.getenv()

session = Hadoop.login( env.gateway, env.username, env.password )

url = "jdbc:db2://${env.hostname}:51000/bigsql:sslConnection=true;sslTrustStoreLocation=./truststore.jks;Password=mypassword;"

db = [ url:url, user:env.username, password:env.password, driver:'com.ibm.db2.jcc.DB2Driver']

sql = Sql.newInstance(db.url, db.user, db.password, db.driver)

def tableName = "test_${new Date().getTime()}"

// Drop table - note this will delete the 'external' folder in hdfs 
println 'Drop table'
sql.execute """
  drop table if exists $tableName
""".toString()

// Put data file in HDFS
dataFile = """1|Pierre
2|Chris
3|Jane
"""

println "Copy data to tmp"
rmData = Hdfs.rm( session ).file( "/tmp/${tableName}.csv" ).now()
putData = Hdfs.put( session ).text( dataFile ).to( "/tmp/${tableName}.csv" ).now()

// Create table
println 'Create table'
sql.execute """
  create external hadoop table if not exists $tableName (id int, name varchar(30))
  row format delimited
  fields terminated by '|'
  lines terminated by '\\n'
  location '/tmp/${tableName}.csv'
""".toString()

// Select from table
def select_statment = "select id, name from $tableName"
println "Select from table: $select_statment"
sql.eachRow(select_statment.toString()) { row ->
  println "ID: $row.id NAME: $row.name"
}

sql.execute """
  drop table if exists $tableName
""".toString()

println "\n>> Connectivity test was successful."
