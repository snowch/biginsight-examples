#!/bin/bash

tar cf secrets.tar connection.properties certificate
travis encrypt-file secrets.tar
