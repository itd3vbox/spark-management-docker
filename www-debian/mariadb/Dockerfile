FROM debian:bookworm

ARG DB_NAME
ARG DB_NAME_TEST
ARG DB_USER
ARG DB_PASSWORD
ARG DB_USER_ADMIN
ARG DB_PASSWORD_ADMIN
ARG DB_ROOT_PASSWORD

# Update packages and install MariaDB server and sed
RUN apt update && \
    apt install -y mariadb-server sed && \
    apt clean

# Copy MariaDB server configuration and initialization scripts
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/db.sql /
COPY ./conf/db-init.sh /

# Replace variables in the SQL file
RUN sed -i "s/\${DB_NAME}/${DB_NAME}/g" /db.sql && \
    sed -i "s/\${DB_NAME_TEST}/${DB_NAME_TEST}/g" /db.sql && \
    sed -i "s/\${DB_USER}/${DB_USER}/g" /db.sql && \
    sed -i "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /db.sql && \
    sed -i "s/\${DB_USER_ADMIN}/${DB_USER_ADMIN}/g" /db.sql && \
    sed -i "s/\${DB_PASSWORD_ADMIN}/${DB_PASSWORD_ADMIN}/g" /db.sql && \
    sed -i "s/\${DB_ROOT_PASSWORD}/${DB_ROOT_PASSWORD}/g" /db.sql

# Make the initialization script executable
RUN chmod +x /db-init.sh

# Expose MariaDB default port
EXPOSE 3306

# 🧠 Here we start MariaDB and run the initialization script
CMD ["/bin/bash", "-c", "service mariadb start && /db-init.sh && tail -f /dev/null"]