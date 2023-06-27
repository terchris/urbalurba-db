# urbalurba-db README.md file
docker compose for setting up psql for urbalurba




## Installation

0. Create a network for the database server to join. This is not necessary if you already have a network that you want to use.

```bash
docker network create --driver bridge --subnet 172.30.0.0/16 --gateway 172.30.0.1 urbalurba-network

docker network create --driver bridge --subnet 172.40.0.0/16 --gateway 172.40.0.1 urbalurba-network


```

The urbalurba-network on the mac development machine is: --subnet 172.30.0.0/16 --gateway 172.30.0.1
For the production server on OCI the network is: --subnet 172.40.0.0/16 --gateway 172.40.0.1

1. update the initdb/init.sql file with the correct database name, username and password.

2. Run the following command to start the database server:
```bash

docker-compose up -d

```

## This is what happens when you run the docker-compose up -d command

1. After installing the database server a database and user is created by running the initdb/init.sql script.

2. The container will be named urbalurba_db and will join the network urbalurba-network. If the network does not exist it will be created.

3. The database will be stored in the volume urbalurba_db_volume. If the volume does not exist it will be created.


## How to connect to the database server

1. Using docker exec

```bash

docker exec -it urbalurba_db psql -U strapi -d urbalurba_db

```

list the tables in the database

```bash

\dt

```

2. Using psql

```bash

psql -h localhost -p 5432 -U strapi -d urbalurba_db

```

list the tables in the database

```bash

\dt

```
