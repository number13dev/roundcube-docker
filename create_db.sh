#!/bin/bash

echo "Database Setup"
echo "create database"
mysqlResult="$(mysql -u $DB_USR -p$DB_PW -h $DB_HOST -se "CREATE DATABASE IF NOT EXISTS roundcube;" )"
echo $mysqlResult

echo "initalize database:"
mysqlResult=$(mysql -u $DB_USR -p$DB_PW -h $DB_HOST 'roundcube' < /var/www/html/SQL/mysql.initial.sql)
echo $mysqlResult