FROM debian:bookworm

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

# Copy the script to set up MariaDB on entrypoint
# COPY setup.sql /docker-entrypoint-initdb.d/setup.sql
COPY password.sh /tmp/password.sh
COPY db.sql /tmp/db.sql
# COPY my.cnf ~/my.cnf
RUN chmod +x /tmp/password.sh
RUN chmod +x /tmp/db.sql

RUN useradd -m -s /bin/bash mariadb_user

# Expose port 3306 to the host
EXPOSE 3306

ENTRYPOINT [ "/tmp/password.sh" ]
# Start MariaDB service
CMD ["mysqld", "--user=mysql"]