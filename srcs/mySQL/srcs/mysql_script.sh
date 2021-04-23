#!/bin/sh

rc-status
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
echo "create database mydb;" | mysql
echo "CREATE USER 'ctycho'@'%' IDENTIFIED BY '';" | mysql
echo "GRANT ALL ON mydb.* TO 'ctycho'@'%' IDENTIFIED BY '' WITH GRANT OPTION;" | mysql
echo "flush privileges;" | mysql
/etc/init.d/mariadb stop

exec mysqld_safe