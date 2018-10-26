FROM postgres:10.4-alpine

LABEL maintainer-twitter="@kevdoran"
LABEL version=1.0.0

COPY create_users.sql /docker-entrypoint-initdb.d/
