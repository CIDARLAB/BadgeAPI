#Dockerized PCRHero

FROM ubuntu:latest
MAINTAINER David Tran <djtran@bu.edu>

#install dependencies
RUN apt-get update
RUN apt-get install -yqq git
RUN apt-get install -yqq python3
RUN apt-get install -yqq python3-pip
RUN apt-get install -yqq build-essential python-dev
RUN pip3 install pymongo
RUN pip3 install bottle
RUN pip3 install requests

#clone git repo if not cached
RUN mkdir -p /home/ubuntu/BadgeAPI
RUN git clone https://github.com/CIDARLAB/BadgeAPI /home/ubuntu/BadgeAPI

VOLUME ["/home/ubuntu/BadgeAPI"]

#expose port for pcrserver
EXPOSE 8080

WORKDIR /home/ubuntu/BadgeAPI/FinalProjectJoseph/Code/

#set startup command to set up mongoDB and pull the latest code from the git repo if cache is outdated.
CMD ["python3", "pcrserver.py"]
