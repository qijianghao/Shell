#!/bin/bash

#db环境变量配置
Databases=(DB_hlbn db_hualu2015 hualu2011 juyiwang) 
dbBakdir='/backup/db/'
HOST="127.0.0.1"
USER="root"
PASSWD="weige123,.!"
Time=`date +"%y-%m-%d"`
mysqldump_path='/usr/bin/mysqldump'

#web环境变量配置
Webdir=/var/www/html/
webBakdir=/backup/web/

#异地备份FTP参数配置
FTP_HOST="221.122.117.188:4242"
FTP_USER="bak_hlbn"
FTP_PASSWD="JkDb9HE5Qy14"

#开始db备份，并清理90天前的历史备份
mkdir -p $dbBakdir$Time
if [ ! -d "$dbBakdir" ]; then
  mkdir -p "$dbBakdir"
fi
for db in ${Databases[*]}
  do
    $mysqldump_path -h$HOST -u$USER -p$PASSWD $db|gzip > $dbBakdir$Time/"$db"_"$Time".sql.gz
  done
    find $dbBakdir -mtime +90 -name "*.sql.gz" -exec rm -rf {} \;
    find $dbBakdir -type d -empty -exec rmdir {} \;
  
#开始web备份，并清理90天前的历史备份
mkdir -p $webBakdir/$Time
cd $webBakdir/$Time
tar zcf hlbn-$Time.tar.gz $Webdir
find $webBakdir -mtime +90 -name "*.tar.gz" -exec rm -rf {} \;
find $webBakdir -type d -empty -exec rmdir {} \;

#异地备份自动上传当天日期的备份文件夹
cd /backup/db
lftp << EOF
open $FTP_HOST
user $FTP_USER $FTP_PASSWD
mkdir db
cd db
mirror -R $Time
bye
EOF

cd /backup/web
lftp << EOF
open $FTP_HOST
user $FTP_USER $FTP_PASSWD
mkdir web
cd web
mirror -R $Time
bye
EOF