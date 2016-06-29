#!/bin/bash

sudo su
echo "If this script doesn't run you don't have mongodb properly setup"

mongo pcrhero
echo "db.createCollection(users)" | mongo pcrhero
echo "db.createCollection(badges)" | mongo pcrhero
echo "db.createCollection(issuers)" | mongo pcrhero 
echo "db.createCollection(users)"| mongo pcrhero
echo "db.createCollection(tasks)" | mongo pcrhero

echo "Now make sure you've modified the IP in pcrserver.py and pcrlib.py. Also change the links in base.tpl so they don't travel outside to the actual pcrhero url"
echo "Make sure that mongo's db path is set and writable, and then setup your filesystem folders to store badge related info"
