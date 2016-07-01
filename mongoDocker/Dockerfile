FROM mongo:latest
MAINTAINER David Tran <djtran@bu.edu>

ADD setupMongoDB.sh /home

RUN chmod u+x /home/setupMongoDB.sh 

RUN /home/setupMongoDB.sh