#!/bin/bash

mongod --port 27017 --smallfiles --fork --logpath /home/ubuntu/mongodb.log

cd /home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/

source setupMongoDB.sh
source startPCR.sh
