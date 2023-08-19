FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY password.sh /tmp/password.sh
COPY db.sql /tmp/db.sql
RUN chmod +x /tmp/password.sh
RUN chmod +x /tmp/db.sql

RUN mkdir /run/mysqld

EXPOSE 3306

ENTRYPOINT [ "/tmp/password.sh" ]
CMD ["mysqld", "--user=mysql", "--bind-address=0.0.0.0"]