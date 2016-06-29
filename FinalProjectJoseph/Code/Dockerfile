#Dockerized MongoDB for use with CIDAR BadgeAPI


FROM ubuntu:latest
MAINTAINER David Tran <djtran@bu.edu>

#import mongo gpg key and create repo file for pkg manager

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

#update sources and install mongodb
RUN apt-get update && apt-get install -yqq apt-utils && apt-get install -yqq mongodb-org
RUN apt-get install -yqq git

RUN apt-get install -yqq python-pip
RUN apt-get install -yqq build-essential python-dev
RUN pip install pymongo
RUN pip install bottle

#clone git repo
RUN mkdir -p /home/ubuntu/BadgeAPI
RUN git clone https://github.com/CIDARLAB/BadgeAPI /home/ubuntu/BadgeAPI

#make necessary directories
RUN mkdir -p /data/db

RUN ls /home/ubuntu
RUN ls /home/ubuntu/BadgeAPI
RUN ls /home/ubuntu/BadgeAPI/FinalProjectJoseph/Code

#make pcrhero DB
RUN mongod --fork --logpath /home/ubuntu/mongodb.log --port 27017
RUN /home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/setupMongoDB.sh

#expose port for pcrserver
EXPOSE 8080

#set dockerized entry-point application
#ENTRYPOINT ["/home/ubuntu/BadgeAPI"]

#set startup command
CMD["/home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/startPCR.sh"]