#!/bin/sh

rc-status
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
echo "create database mydb;" | mysql
mysql -u root mydb < mydb.sql
echo "CREATE USER 'ctycho'@'%' IDENTIFIED BY '';" | mysql
echo "GRANT ALL ON mydb.* TO 'ctycho'@'%' IDENTIFIED BY '' WITH GRANT OPTION;" | mysql
echo "flush privileges;" | mysql
/etc/init.d/mariadb stop

/usr/bin/supervisord -c /etc/supervisord.conf
