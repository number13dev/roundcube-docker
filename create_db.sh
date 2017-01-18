#!/bin/bash

echo "Database Setup"
DB_HOST=mysql
mysqlResult="${DOLLAR}(mysql -u $DB_USR -p $DB_PW -h ${DOLLAR}DB_HOST -se "CREATE DATABASE IF NOT EXISTS roundcube;" )"

echo $mysqlResult