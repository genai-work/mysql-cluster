#!/bin/bash

echo "SERVER_ID = $SERVER_ID"
echo "HOSTNAME = $HOSTNAME"

# Replace placeholders in the my.cnf file with actual environment variable values
sed -i "s/@@SERVER_ID@@/$SERVER_ID/g" /etc/mysql/my.cnf
sed -i "s/@@HOSTNAME@@/$HOSTNAME/g" /etc/mysql/my.cnf

# Start MySQL server
docker-entrypoint.sh mysqld
