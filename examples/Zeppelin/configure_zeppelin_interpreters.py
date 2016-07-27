#!/usr/bin/env python

import requests

BASE_URL='http://localhost:8080'

response = requests.get(BASE_URL + '/api/interpreter/setting')

print(response)
