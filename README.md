# urbalurba-db README.md file
docker compose for setting up psql for urbalurba




## Installation

1. Create a .env file in the same directory a the docker-compose file. And copy the following variables from the main .env file:
```
The .env file variables are:
```
DATABASE_PORT=5435
DATABASE_NAME="urbalurba-db"
DATABASE_USERNAME=strapi
DATABASE_PASSWORD=Smartbygutta01
```




2. Run the following command to start the database server:
```bash

docker-compose up -d

```

## This is what happens when you run the docker-compose up -d command

1. After installing the database server a database and user is be created with the following commands:

```psql
create database DATABASE_NAME;
create user DATABASE_USERNAME with encrypted password DATABASE_PASSWORD;
grant all privileges on database DATABASE_NAME to DATABASE_USERNAME;

```

2. The container will be named urbalurba-db and will join the network urbalurba-network. If the network does not exist it will be created.

3. The database will be stored in the volume urbalurba-db-data. If the volume does not exist it will be created.
