#!/bin/bash

echo "If this script doesn't run you don't have mongodb properly setup"

mongod --repair
mongod --fork --logpath /var/log/mongodb.log

#If no time is given for mongod to setup you will get shat on sorry dood
sleep 2
mongo pcrhero
mongo pcrhero --eval "db.createCollection('apps')"
mongo pcrhero --eval "db.createCollection('badges')"
mongo pcrhero --eval "db.createCollection('issuers')"
mongo pcrhero --eval "db.createCollection('users')"
mongo pcrhero --eval "db.createCollection('tasks')"

mongod --shutdown

touch /tmp/mongodb-27017.sock
rm /tmp/mongodb-27017.sock

echo "Now make sure you've modified the IP in pcrserver.py and pcrlib.py. Also change the links in base.tpl so they don't travel outside to the actual pcrhero url"
echo "Make sure that mongo's db path is set and writable, and then setup your filesystem folders to store badge related info"
