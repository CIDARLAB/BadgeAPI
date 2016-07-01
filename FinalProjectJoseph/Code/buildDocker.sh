#!/bin/bash

docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)

#build the PCRhero image
echo "[STATUS]		Building djtran/badgeapi image..."
docker build -t djtran/badgeapi .

#create network for them to run on
echo "[STATUS] 		Checking for Docker network 'pcrhero'"
docker network ls > pipe.txt

if grep -q 'pcrhero' 'pipe.txt' && echo $?
	then
		echo "[STATUS]		Network pcrhero exists."
	else
		echo "[STATUS]		Creating docker network pcrhero..."
		docker network create pcrhero
		echo "[STATUS] 		Network created!"
fi
rm pipe.txt

docker ps -a > check.txt

if grep -q 'pcrmongo' 'check.txt' && echo $?
	then
		echo "[STATUS]		Removing existing pcrmongo and pcrhero containers..."
		docker rm pcrmongo 
		docker rm pcrhero

		#Run an instance of mongoDB on the network for pcrhero to use.
		echo "[STATUS]		Running mongo container as a daemon process with port 27017 exposed..."
		docker run -d -p 27017:27017 --net pcrhero --name pcrmongo djtran/pcrmongo 

		#run an instance of the PCRhero container, will setup it's own mongo collections.
		echo "[STATUS]		Running pcrhero container with port 8080 exposed..."
		docker run -d -p 8080:8080 --net pcrhero --name pcrhero djtran/badgeapi

	else
		#Run an instance of mongoDB on the network for pcrhero to use.
		echo "[STATUS]		Running mongo container as a daemon process with port 27017 exposed..."
		docker run -d -p 27017:27017 --net pcrhero --name pcrmongo djtran/pcrmongo 

		#run an instance of the PCRhero container, will setup it's own mongo collections.
		echo "[STATUS]		Running pcrhero container with port 8080 exposed..."
		docker run -d -p 8080:8080 --net pcrhero --name pcrhero djtran/badgeapi
fi