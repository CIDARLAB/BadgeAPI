# PCR Hero Server

###Dependencies

Python3 (3.4 and above should be good, latest preferable)

bottle for Python

pymongo for Python

MongoDB

The environment I ran this on was an Amazon Web Services (AWS) Ubuntu server (of the free variety).

## Filesystem setup
The filesystem was arranged as follows:
/home/ubuntu/BadgeAPI/   <-- base directory, contains the server file, libraries file, and .tpls

/home/ubuntu/BadgeAPI/apps/

/home/ubuntu/BadgeAPI/awardedbadges/

/home/ubuntu/BadgeAPI/badges/

/home/ubuntu/BadgeAPI/images/

/home/ubuntu/BadgeAPI/issuers/

/home/ubuntu/BadgeAPI/criteria/

/home/ubuntu/BadgeAPI/static/

/home/ubuntu/BadgeAPI/users/

There is absolutely nothing special about this file structure; apart from a few references that I have likely neglected to link to CONSTANT variables at the begining, you may substitute another base directory ad libitum. 

###MongoDB setup
You will need to set up a database (pcrhero) and collections (apps, badges, issuers, tasks, users).

  mongo
  use pcrhero
  db.createCollection("apps")
  ...
  ...

###Python server and library file setup
You will need to replace the value of HOSTIP in both the server and library file (it's at the top).
You will also need to replace the IP address at the very bottom of the file
```
run(host='0.0.0.0', port=8000, debug=True)
```
With your host, any port number that you wish to use, and remember to set ```debug=False``` when you are deploying your server to the public as this will leak important information about the server code and file dependencies!

Finally, you will need to add your email to the admins database before you can award badges.

To run, simply ```python3 pcrserver.py```
