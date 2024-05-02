#!/bin/bash

# Replace with your MySQL connection details (ensure these are secured using secrets in production)
MYSQL_HOST="mysql"  # Replace with your MySQL service name
MYSQL_USER="root"
MYSQL_PASSWORD="this-is-root-785-password"

# sleep for 5min
sleep 300

# Connect to MySQL server and execute commands
mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD << EOF

  -- Create the database named 'students'
  CREATE DATABASE students;

  -- Use the newly created database
  USE students;

  -- Create the table named 'students'
  CREATE TABLE students (
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (email) -- Set email as the primary key for efficient lookups
  );

  -- Create the user 'brendan123'
  CREATE USER 'brendan123'@'%' IDENTIFIED BY 'this-is-3857-password';

  -- Grant all privileges on the 'students' database to the user 'brendan123'
  GRANT ALL PRIVILEGES ON students.* TO 'brendan123'@'%';

  -- Flush privileges to apply changes
  FLUSH PRIVILEGES;

EOF

echo "Database schema initialized successfully!"

exit 0