#!/bin/bash
yum install -y centos-release
if [ `rpm -q centos-release|cut -d- -f3` -eq 7 ];then
  rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
  yum install mysql-community-server -y
  sed -i '/\[mysqld\]/a\lower_case_table_names \= 0' /etc/my.cnf
  sed -i '/\[mysqld\]/a\character_set_server \= utf8' /etc/my.cnf
  sed -i "/\[mysqld\]/a\init_connect \= \'SET NAMES utf8\'" /etc/my.cnf
  
  /bin/systemctl enable mysqld
  /bin/systemctl restart mysqld
  
elif [ `rpm -q centos-release|cut -d- -f3` -eq 6 ];then
  rpm -Uvh http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
  yum install mysql-community-server -y
  sed -i '/\[mysqld\]/a\lower_case_table_names \= 0' /etc/my.cnf
  sed -i '/\[mysqld\]/a\character_set_server \= utf8' /etc/my.cnf
  sed -i "/\[mysqld\]/a\init_connect \= \'SET NAMES utf8\'" /etc/my.cnf
  
  chkconfig mysqld on
  service mysqld restart
fi

mysql_secure_installation
