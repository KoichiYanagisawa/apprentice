FROM mysql:5.7-debian

ENV MYSQL_ROOT_PASSWORD=root_pass

RUN apt-get update
RUN apt-get install -y wget unzip
RUN wget https://downloads.mysql.com/docs/world-db.zip
RUN unzip world-db.zip
RUN mv world-db/world.sql /docker-entrypoint-initdb.d/world.sql
