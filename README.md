# urbalurba-db README.md file
docker compose for setting up psql for urbalurba
The .env file variables are:
```
DATABASE_PORT=5435
DATABASE_NAME="urbalurba-db"
DATABASE_USERNAME=strapi
DATABASE_PASSWORD=Smartbygutta01
```



After installing the database server a database and user is be created:

```psql
create database DATABASE_NAME;
create user DATABASE_USERNAME with encrypted password DATABASE_PASSWORD;
grant all privileges on database DATABASE_NAME to DATABASE_USERNAME;

```
