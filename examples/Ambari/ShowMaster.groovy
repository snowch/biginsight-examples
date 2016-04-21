import groovyx.net.http.RESTClient
import groovy.json.JsonSlurper

env = System.getenv()

ambariUrl = env.ambariUrl
ambariUser = env.ambariUsername
ambariPassword = env.ambariPassword

def client = new RESTClient( ambariUrl )
client.ignoreSSLIssues()

client.headers['Authorization'] = 'Basic ' + "$ambariUser:$ambariPassword".getBytes('iso-8859-1').encodeBase64()
client.headers['X-Requested-By'] = 'ambari'

// Make REST call to get clusters
def resp = client.get( path : 'api/v1/clusters' )

assert resp.status == 200  // HTTP response code; 404 means not found, etc.

// Parse output to JSON
def jsonSlurper = new JsonSlurper()
def object = jsonSlurper.parseText(resp.data.text)

// Get Cluster Name
clusterName = object.items.Clusters[0].cluster_name

// Define service and corresponding master components
def services = [
   'BIGSQL':'BIGSQL_HEAD',
   'KNOX':'KNOX_GATEWAY',
   'HIVE':'HIVE_SERVER',
]

println ""

services.each { service_name, component_name ->

   // Make REST to get compoent info
   def respComponent = client.get( path : 'api/v1/clusters/' + clusterName + '/services/' + service_name + '/components/' + component_name )

   assert respComponent.status == 200  // HTTP response code; 404 means not found, etc.

   // Get hostname
   def object_component = jsonSlurper.parseText(respComponent.data.text)

   println "${component_name} (${service_name}) hostname is: " + object_component.host_components.HostRoles.host_name

}
