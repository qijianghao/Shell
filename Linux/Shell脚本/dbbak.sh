#!/bin/bash
Databases=(dadifengjing) 
Backpath='/home/backup/db/'
HOST="127.0.0.1"
USER="abc"
PASSWD="123456"
Time=`date +"%y-%m-%d"`
mysqldump_path='/www/wdlinux/mysql-5.5.54/bin/mysqldump'

if [ ! -d "$Backpath" ]; then
  mkdir -p "$Backpath"
fi

mkdir -p $Backpath$Time
for db in ${Databases[*]}
  do
    $mysqldump_path -h$HOST -u$USER -p$PASSWD $db|gzip > $Backpath$Time/"$db"_"$Time".sql.gz
  done

    #保留60天备份文件
    find $Backpath -mtime +60 -name "*.sql.gz" -exec rm -rf {} \;
    #删除空目录
    find $Bakdir -type d -empty -exec rmdir {} \;