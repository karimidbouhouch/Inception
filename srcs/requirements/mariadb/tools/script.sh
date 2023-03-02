#! /bin/bash
service mysql start
echo "CREATE DATABASE IF NOT EXISTS $DATABASE;" | mariadb
echo "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';" | mariadb
mysqladmin shutdown -p$MYSQL_ROOT_PASSWORD
mysqld_safe