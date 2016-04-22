
### Quick Links

Running `./gradlew` from the top level folder will print some key links for your cluster, e.g.:

```
$ ./gradlew
--------------------------------------------------------------------------------------------------------------------------------------
                                                       CLUSTER DETAILS
--------------------------------------------------------------------------------------------------------------------------------------
Ambari URL         ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:9443/
BigInsights URL    ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:8443/gateway/default/BigInsightsWeb/index.html
YARN URL           ::      https://ehaasp-12345-mastermanager.bi.services.bluemix.net:8443/gateway/yarnui/yarn/apps
Master Mgr SSH URL ::      ssh://biadmin@ehaasp-12345-mastermanager.bi.services.bluemix.net
Master 2   SSH URL ::      ssh://biadmin@ehaasp-12345-master-2.bi.services.bluemix.net
--------------------------------------------------------------------------------------------------------------------------------------
```

*********************************************************************

### Tips

If you want to use the scripts for multiple clusters, you can create multiple connection.properties and certificate files, e.g

- connection.properties.cluster1, connection.properties.cluster2
- certificate.cluster1, certificate.cluster2

You can set the current cluster on *nix using the `ln` command, e.g

```
# run tests on cluster 1
ln -sf connection.properties.cluster1 connection.properties
ln -sf certificate.cluster1 certificate
./gradlew test

# run tests on cluster 2
ln -sf connection.properties.cluster2 connection.properties
ln -sf certificate.cluster2 certificate
./gradlew test
```

*********************************************************************

