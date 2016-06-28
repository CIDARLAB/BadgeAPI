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



#make necessary directories
RUN mkdir -p /home/ubuntu/db
RUN mkdir -p /home/ubuntu/BadgeAPI/apps/
RUN mkdir -p /home/ubuntu/BadgeAPI/awardedbadges/
RUN mkdir -p /home/ubuntu/BadgeAPI/badges/
RUN mkdir -p /home/ubuntu/BadgeAPI/images/
RUN mkdir -p /home/ubuntu/BadgeAPI/issuers/
RUN mkdir -p /home/ubuntu/BadgeAPI/criteria/
RUN mkdir -p /home/ubuntu/BadgeAPI/static/
RUN mkdir -p /home/ubuntu/BadgeAPI/users/

#clone git repo
RUN cd /home/ubuntu/
RUN git clone https://github.com/CIDARLAB/BadgeAPI

#make pcrhero DB
RUN mongod --dbpath /home/ubuntu/db
RUN /home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/setupMongoDB.sh

#expose port for pcrserver
EXPOSE 8080

#set usr/bin/mongod as dockerized entry-point application
ENTRYPOINT ["/home/ubuntu/BadgeAPI"]

#set startup command
CMD["/home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/startPCR.sh"]