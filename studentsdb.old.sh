#!/bin/bash

echo "Start DB script" >> dbscript.log

# Replace with your MySQL connection details (ensure these are secured using secrets in production)
MYSQL_HOST="mysql"  # Replace with your MySQL service name
MYSQL_USER="root"
MYSQL_PASSWORD="this-is-the-root-785-password"

echo "sleeping" >> dbscript.log

# sleep for 5min
sleep 120

echo "end sleep" >> dbscript.log

# Connect to MySQL server and execute commands
mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD << EOF

  -- Create the database named 'students'
  CREATE DATABASE IF NOT EXISTS students;

  -- Use the newly created database
  USE students;

  -- Create the table named 'students'
  CREATE TABLE IF NOT EXISTS students (
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (email) -- Set email as the primary key for efficient lookups
  );

EOF

echo "Database schema initialized successfully!" >> dbscript.log

exit 0