数据库备份
支持多库备份

#!/bin/bash
Databases=(db_Name db_Name2 db_Name3) 
Backpath='/www/backup/db/'
HOST="127.0.0.1"
USER="root"
PASSWD="PASSWD"
Time=`date +"%y-%m-%d"`
mkdir -p $Backpath$Time
if [ ! -d "$Backpath" ]; then
  mkdir -p "$Backpath"
fi
for db in ${Databases[*]}
  do
    /usr/bin/mysqldump -h$HOST -u$USER -p$PASSWD $db|gzip > $Backpath$Time/"$db"_"$Time".sql.gz
#    cd  $Backpath$Time/
#    tar zcf "$db"_"$Time".sql.tar.gz "$db"_"$Time".sql
#    find $Backpath -mtime +60 -name "*.sql.tar.gz" -exec rm -rf {} \;
  done

文件打包

#!/bin/bash
Webdir=/www/website/
Bakdir=/www/backup/web/
Date=`date +"%y-%m-%d"`
mkdir -p $Bakdir/$Date
cd $Bakdir/$Date
tar zcf flynar.Manager-$Date.tar.gz $Webdir