#!/bin/bash

echo "Database Setup"
DB_HOST=mysql
mysqlResult="$(mysql -u $DB_USR -p$DB_PW -h $DB_HOST -se "CREATE DATABASE IF NOT EXISTS roundcube;" )"

echo $mysqlResult