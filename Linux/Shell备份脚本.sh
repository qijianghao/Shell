数据库备份
支持多库备份

#!/bin/bash
Databases=(db_Name db_Name2 db_Name3) 
Backpath='/www/backup/db/'
HOST="127.0.0.1"
USER="root"
PASSWD="PASSWD"
Time=`date +"%y-%m-%d"`
mysqldump_path='/usr/bin/mysqldump'
mkdir -p $Backpath$Time
if [ ! -d "$Backpath" ]; then
  mkdir -p "$Backpath"
fi
for db in ${Databases[*]}
  do
    $mysqldump_path -h$HOST -u$USER -p$PASSWD $db|gzip > $Backpath$Time/"$db"_"$Time".sql.gz
  done
#    cd  $Backpath$Time/
#    tar zcf "$db"_"$Time".sql.tar.gz "$db"_"$Time".sql
#    find $Backpath -mtime +60 -name "*.sql.gz" -exec rm -rf {} \;
#     find $Bakdir -type d -empty -exec rmdir {} \; #删除空目录

#All db

#!/bin/bash

Backpath='/backup/db/'
HOST="127.0.0.1"
USER="root"
PASSWD="hongru123,.!"
Time=`date +"%y-%m-%d"`
mysqldump_path='/usr/bin/mysqldump'
Databases=`/usr/bin/mysql -u$USER -p$PASSWD -Bse 'show databases'`
mkdir -p $Backpath$Time
if [ ! -d "$Backpath" ]; then
  mkdir -p "$Backpath"
fi
for db in $Databases
  do
    $mysqldump_path -h$HOST -u$USER -p$PASSWD $db|gzip > $Backpath$Time/"$db"_"$Time".sql.gz
  done

文件打包

#!/bin/bash
Webdir=/www/website/
Bakdir=/www/backup/web/
Date=`date +"%y-%m-%d"`
mkdir -p $Bakdir/$Date
cd $Bakdir/$Date
tar zcf flynar.Manager-$Date.tar.gz $Webdir

tar -zcf /backup/web/www_`date +%Y%m%d`.tar.gz /www/web.com

for循环打包，文件夹下子文件夹单独打包

#!/bin/bash
Webdir=/www/website/
Bakdir=/www/backup/web/
Date=`date +"%y-%m-%d"`
find ${Webdir} -mindepth 1 -maxdepth 1 -type d |grep -v "hongru"|awk -F "/" '{print $NF}' > $Bakdir/BakdirName.txt
BakdirName=$(cat $Bakdir/BakdirName.txt)
mkdir -p $Bakdir/$Date
cd $Bakdir/$Date
for j in $BakdirName
	do
		tar zcf $j-$Date.tar.gz ${Webdir}/$j
	done
find $Bakdir -mtime +60 -name "*.tar.gz" -exec rm -rf {} \;
find $Bakdir -type d -empty -exec rmdir {} \;

异地ftp自动备份
#!/bin/bash
Time=`date +"%y-%m-%d"`
FTP_HOST="221.122.117.188:4242"
FTP_USER="XHR_184"
FTP_PASSWD="z5trs9xXBJe9ET"

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


Crontb计划任务
0 2 1 * * /backup/webbak.sh 2>&1 >>/backup/webbak.log
0 1 * * 1 /backup/dbbak.sh 2>&1 >>/backup/dbbak.log

