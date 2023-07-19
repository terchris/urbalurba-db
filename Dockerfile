FROM postgres:12-alpine

# set environment variables
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB urbalurba

# copy the initdb scripts into the Docker image
COPY initdb/ /docker-entrypoint-initdb.d/
