#!/usr/bin/env python

# This scripts lists all files in an ObjectStore container and
# moves them one at a time to HDFS using the webhdfs protocol.
#
# You may need to install swiftclient: `pip install python-swiftclient`

import swiftclient
import requests

#### beg config ####

os_auth_url  = 'https://identity.open.softlayer.com/v3'
os_proj_id   = ''
os_user_id   = ''
os_region    = 'dallas'
os_pass      = ''
os_container = 'Filecontainer'

ignore_files = ['somefile','someotherfile']

bi_host      = ''
bi_port      = '8443'
bi_user      = 'biadmin'
bi_pass      = ''
bi_folder    = '' # destination folder in hdfs   

overwrite    = 'true' # overwrite file if it already exists in hdfs, true|false

#### end config ####

bi_url  = 'https://{0}:{1}/gateway/default'.format(bi_host, bi_port)

# Get a Swift client connection object
def getConn():
    return swiftclient.Connection(
            key          = os_pass,
            authurl      = os_auth_url,
            auth_version = '3',
            os_options={
                "project_id"  : os_proj_id,
                "user_id"     : os_user_id,
                "region_name" : os_region
                })


for os_data in getConn().get_container(os_container)[1]:
    filename = os_data['name']
    filesize = os_data['bytes']

    if filename in ignore_files:
        continue    

    print("Retrieving: {0} size {1} bytes".format(filename, filesize))

    # NOTE! This reads the whole file into memory - it may
    # crash if you have large files
    
    obj = getConn().get_object('Filecontainer', filename)

    print("Object size: {0}".format(len(obj[1])))

    url = "{0}/webhdfs/v1/{1}/{2}?op=CREATE&overwrite={3}".format(bi_url, bi_folder, filename, overwrite)

    # WARNING! certification verifcation is disabled `verify = False` as per the bluemix
    # documentation example that uses curl with the -k flag

    # First request is to get 'Location' header which contains URL for PUT'ting the data
    response = requests.put(
        url,
        auth = (bi_user, bi_pass),
        verify = False,
        allow_redirects = False
    )

    if not response.status_code == requests.codes.ok:
        print(response.content)
        response.raise_for_status()

    # Save the file to the url obtained from the previous request
    response = requests.put(
        response.headers['Location'],
        auth = (bi_user, bi_pass),
        data = obj[1],
        verify = False
    )

    if not response.status_code == requests.codes.ok:
        print(response.content)
        response.raise_for_status()
        
    print("Uploaded: {0}".format(filename))
