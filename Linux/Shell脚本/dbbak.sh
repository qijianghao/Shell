#!/bin/bash
Databases=(dadifengjing) 
Bakdir='/home/backup/db/'
HOST="127.0.0.1"
USER="abc"
PASSWD="123456"
Time=`date +"%y-%m-%d"`
mysqldump_path='/www/wdlinux/mysql-5.5.54/bin/mysqldump'

if [ ! -d "$Bakdir" ]; then
  mkdir -p "$Bakdir"
fi

mkdir -p $Bakdir$Time
for db in ${Databases[*]}
  do
    $mysqldump_path -h$HOST -u$USER -p$PASSWD $db|gzip > $Bakdir$Time/"$db"_"$Time".sql.gz
  done

    #保留60天备份文件
    find $Bakdir -mtime +60 -name "*.sql.gz" -exec rm -rf {} \;
    #删除空目录
    find $Bakdir -type d -empty -exec rmdir {} \;