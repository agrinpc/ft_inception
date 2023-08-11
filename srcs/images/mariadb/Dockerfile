FROM debian:bookworm

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Copy the script to set up MariaDB on entrypoint
COPY password.sh /tmp/password.sh
COPY db.sql /tmp/db.sql
RUN chmod +x /tmp/password.sh
RUN chmod +x /tmp/db.sql

# RUN useradd -m -s /bin/bash mariadb_user

EXPOSE 3306

ENTRYPOINT [ "/tmp/password.sh" ]
CMD ["mysqld", "--user=mysql", "--bind-address=0.0.0.0"]