#!/bin/bash

#db环境变量配置 地址 账号 密码
HOST="127.0.0.1"
USER="root"
PASSWD="123456"
Time=`date +"%y-%m-%d"`
#数据库备份目录dbBakdir
dbBakdir='/www/backup/backup/mysql/'
#Mysql安装目录（指定到bin目录即可）
Mysql_install_path='/www/wdlinux/mysql-5.6.35/bin'
#备份所有数据库（排除系统数据库）
Databases=`$Mysql_install_path/mysql -u$USER -p$PASSWD -Bse 'show databases' | grep -Ev 'performance_schema|information_schema|mysql|test'`


#web环境变量配置 Webdir网站文件存放目录 Bakdir网站文件备分目录 
Webdir='/www/web/'
webBakdir='/www/backup/backup/web/'
Date=`date +"%y-%m-%d"`
#生成需要备份的目录名（排除指定文件夹）
mkdir -p $webBakdir/$Date
find ${Webdir} -mindepth 1 -maxdepth 1 -type d | grep -Ev "js2017|gongdan_fix_com_cn|default"|awk -F "/" '{print $NF}' > $webBakdir/BakdirName.txt
BakdirName=$(cat $webBakdir/BakdirName.txt)


#异地备份FTP参数配置
FTP_HOST="1.1.1.1:21"
FTP_USER="Username"
FTP_PASSWD="123456"


#开始db备份，并清理60天前的历史备份
mkdir -p $dbBakdir/$Time
for db in $Databases
  do
    $Mysql_install_path/mysqldump -h$HOST -u$USER -p$PASSWD $db|gzip > $dbBakdir/$Time/"$db"_"$Time".sql.gz
  done

    #保留60天备份文件
    find $dbBakdir -mtime +60 -name "*.sql.gz" -exec rm -rf {} \;
    #删除空目录
    find $dbBakdir -type d -empty -exec rmdir {} \;
 
#开始web备份，并清理60天前的历史备份
cd $webBakdir/$Date
for j in $BakdirName
	do
		tar zcf $j-$Date.tar.gz ${Webdir}/$j
	done

    #保留60天备份文件
    find $webBakdir -mtime +60 -name "*.tar.gz" -exec rm -rf {} \;
    #删除空目录
    find $webBakdir -type d -empty -exec rmdir {} \;

#异地备份自动上传当天日期的备份文件夹
cd $dbBakdir
lftp << EOF
open $FTP_HOST
user $FTP_USER $FTP_PASSWD
mkdir db
cd db
mirror -R $Time
bye
EOF

cd $webBakdir
lftp << EOF
open $FTP_HOST
user $FTP_USER $FTP_PASSWD
mkdir web
cd web
mirror -R $Time
bye
EOF