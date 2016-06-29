#!/bin/bash

mongod --port 27017 --smallfiles --fork --logpath /home/ubuntu/mongodb.log

/bin/bash -c source /home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/setupMongoDB.sh

/bin/bash -c source /home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/startPCR.sh
