#!/bin/bash

echo "Starting MariaDB..."
mysqld_safe &

echo "Waiting for MariaDB..."
while ! mysqladmin ping -uroot -p"${DB_ROOT_PASSWORD}" --silent; do
    sleep 1
done

echo "Initializing database..."
mysql -uroot -p"${DB_ROOT_PASSWORD}" < /db.sql
if [ $? -ne 0 ]; then
    echo "Error executing SQL script."
    exit 1
fi

echo "SQL script executed successfully."

# Keep MariaDB running
echo "MariaDB is running..."
tail -f /dev/null
