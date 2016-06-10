#!/bin/bash

sudo su
echo "If this script doesn't run you don't have mongodb properly setup"

mongo "use pcrhero"
mongo "db.createCollection(users)"
mongo "db.createCollection(badges)"
mongo "db.createCollection(issuers)"
mongo "db.createCollection(users)"
mongo "db.createCollection(tasks)"

echo "Now make sure you've modified the IP in pcrserver.py and pcrlib.py. Also change the links in base.tpl so they don't travel outside to the actual pcrhero url"
echo "Make sure that mongo's db path is set and writable, and then setup your filesystem folders to store badge related info"
