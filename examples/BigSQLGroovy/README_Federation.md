BIGSQL should be setup such that federation is on and appropriate library are in place to allow wrapper to function beetween BIGSQL and data source.

You need DBADM privlege to do following. As bigsql on master-2 (Big SQL Head Node). Do the following.

Catalog the remote server:
```
db2 CATALOG TCPIP NODE DASHNODE REMOTE changeme-host-name SERVER change-me-port-number SECURITY SSL
```

Catalog the remote database:
```
db2 CATALOG DATABASE BLUDB AS BLUDB AT NODE DASHNODE
```

