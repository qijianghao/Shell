1、数据库备份
支持多库备份

#!/bin/bash
Databases=(db_Name1 db_Name2 db_Name3) 
Bakdir='/www/backup/db/'
HOST="127.0.0.1"
USER="root"
PASSWD="123456"
Time=`date +"%y-%m-%d"`
mysqldump_path='/usr/bin/mysqldump'

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


2、查询当前实例下所有数据库，for循环备份

#!/bin/bash
Bakdir='/backup/db/'
HOST="127.0.0.1"
USER="root"
PASSWD="123456"
Time=`date +"%y-%m-%d"`
Mysql_install_path='/usr/bin'
Databases=`$Mysql_install_path/mysql -u$USER -p$PASSWD -Bse 'show databases' | grep -Ev 'performance_schema|information_schema|mysql|test'`

if [ ! -d "$Bakdir" ]; then
  mkdir -p "$Bakdir"
fi

mkdir -p $Bakdir$Time
for db in $Databases
  do
    $Mysql_install_path/mysqldump -h$HOST -u$USER -p$PASSWD $db|gzip > $Bakdir$Time/"$db"_"$Time".sql.gz
  done

    #保留60天备份文件
    find $Bakdir -mtime +60 -name "*.sql.gz" -exec rm -rf {} \;
    #删除空目录
    find $Bakdir -type d -empty -exec rmdir {} \;


3、文件打包

#!/bin/bash
Webdir='/www/website/abc.com'
Bakdir='/www/backup/web/'
Bakname='abc.com'
Date=`date +"%y-%m-%d"`
mkdir -p $Bakdir/$Date
cd $Bakdir/$Date
tar zcf $Bakname-$Date.tar.gz $Webdir

    #保留60天备份文件
    find $Bakdir -mtime +60 -name "*.tar.gz" -exec rm -rf {} \;
    #删除空目录
    find $Bakdir -type d -empty -exec rmdir {} \;

4、for循环打包，文件夹下子文件夹单独打包

#!/bin/bash
Webdir='/www/website/'
Bakdir='/www/backup/web/'
Date=`date +"%y-%m-%d"`
find ${Webdir} -mindepth 1 -maxdepth 1 -type d |grep -v "hongru"|awk -F "/" '{print $NF}' > $Bakdir/BakdirName.txt
BakdirName=$(cat $Bakdir/BakdirName.txt)
mkdir -p $Bakdir/$Date
cd $Bakdir/$Date
for j in $BakdirName
	do
		tar zcf $j-$Date.tar.gz ${Webdir}/$j
	done

    #保留60天备份文件
    find $Bakdir -mtime +60 -name "*.tar.gz" -exec rm -rf {} \;
    #删除空目录
    find $Bakdir -type d -empty -exec rmdir {} \;


5、异地ftp自动备份
#!/bin/bash
Time=`date +"%y-%m-%d"`
FTP_HOST="1.1.1.1"
FTP_USER="UserNmae"
FTP_PASSWD="123456"

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


6、Crontb计划任务
#每月1号2点开始备份网页文件
0 2 1 * * /backup/webbak.sh 2>&1 >>/backup/webbak.log
#每周一 1点开始备份数据库
0 1 * * 1 /backup/dbbak.sh 2>&1 >>/backup/dbbak.log
