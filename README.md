# urbalurba-db README.md file
docker compose for setting up psql for urbalurba






## Installation

When running the urbalurba-db we do this from the folder named urbalurba-containers.
On dag the folder is /home/terchris/urbalurba-containers on mac it is /Users/tec/learn/urbalurba2023/urbalurba-containers

In urbalurba_containers clone the repository
Copy the repository using:
```bash
git clone https://github.com/terchris/urbalurba-db.git urbalurba-db
```




0. Create a network for the database server to join. This is not necessary if you already have a network that you want to use.

The urbalurba-network on the mac development machine is: --subnet 172.30.0.0/16 --gateway 172.30.0.1
For the production server on OCI the network is: --subnet 172.40.0.0/16 --gateway 172.40.0.1

on mac use this:
```bash
docker network create --driver bridge --subnet 172.30.0.0/16 --gateway 172.30.0.1 urbalurba-network
```
on dag use this:
```bash
docker network create --driver bridge --subnet 172.40.0.0/16 --gateway 172.40.0.1 urbalurba-network

```



1. The database is urbalurba_db and the user is strapi - this and the password is hardcoded in the folder initdb

2. Run the following command to start the database server:
```bash

docker compose up 

```
On dag you will need to use sudo docker compose up

You will see the output - if you see something like this then the database i created and ready:
```
 /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/01_create_database.sql
urbalurba_db  | CREATE DATABASE
urbalurba_db  | /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/02_create_user.sql
urbalurba_db  | psql:/docker-entrypoint-initdb.d/02_create_user.sql:10: NOTICE:  User created successfully
urbalurba_db  | DO
``` 


## This is what happens when you run the docker-compose up -d command

1. After installing the database server a database and user is created by running the script(s) in initdb folder.

2. The container will be named urbalurba-db and will join the network urbalurba-network. If the network does not exist it will be created.

3. The database will be stored in the volume urbalurba_db_volume. If the volume does not exist it will be created.


## How to connect to the database server

1. Using docker exec

```bash

docker exec -it urbalurba-db psql -U strapi -d urbalurba_db

```


2. Using psql inside the container

```bash

psql -U strapi -d urbalurba_db

```

If you are able to connect to the database server you will see the following prompt:

```bash
psql (14.1)
Type "help" for help.

```bash

This means that it is all cofigured and working properly.
Exit psql by typing \q and pressing enter.

## where are the data stored
The database is stored in the volume named urbalurba-db-volume
make surte to make backups

