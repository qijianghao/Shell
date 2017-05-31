1�����ݿⱸ��
֧�ֶ�ⱸ��

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

    #����60�챸���ļ�
    find $Bakdir -mtime +60 -name "*.sql.gz" -exec rm -rf {} \;
    #ɾ����Ŀ¼
    find $Bakdir -type d -empty -exec rmdir {} \;


2����ѯ��ǰʵ�����������ݣ�forѭ������

#!/bin/bash
Bakdir='/backup/db/'
HOST="127.0.0.1"
USER="root"
PASSWD="123456"
Time=`date +"%y-%m-%d"`
mysqldump_path='/usr/bin/mysqldump'
Databases=`/usr/bin/mysql -u$USER -p$PASSWD -Bse 'show databases'`

if [ ! -d "$Bakdir" ]; then
  mkdir -p "$Bakdir"
fi

mkdir -p $Bakdir$Time
for db in $Databases
  do
    $mysqldump_path -h$HOST -u$USER -p$PASSWD $db|gzip > $Bakdir$Time/"$db"_"$Time".sql.gz
  done

    #����60�챸���ļ�
    find $Bakdir -mtime +60 -name "*.sql.gz" -exec rm -rf {} \;
    #ɾ����Ŀ¼
    find $Bakdir -type d -empty -exec rmdir {} \;


3���ļ����

#!/bin/bash
Webdir='/www/website/abc.com'
Bakdir='/www/backup/web/'
Bakname='abc.com'
Date=`date +"%y-%m-%d"`
mkdir -p $Bakdir/$Date
cd $Bakdir/$Date
tar zcf $Bakname-$Date.tar.gz $Webdir

    #����60�챸���ļ�
    find $Bakdir -mtime +60 -name "*.tar.gz" -exec rm -rf {} \;
    #ɾ����Ŀ¼
    find $Bakdir -type d -empty -exec rmdir {} \;

4��forѭ��������ļ��������ļ��е������

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

    #����60�챸���ļ�
    find $Bakdir -mtime +60 -name "*.tar.gz" -exec rm -rf {} \;
    #ɾ����Ŀ¼
    find $Bakdir -type d -empty -exec rmdir {} \;


5�����ftp�Զ�����
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


6��Crontb�ƻ�����
#ÿ��1��2�㿪ʼ������ҳ�ļ�
0 2 1 * * /backup/webbak.sh 2>&1 >>/backup/webbak.log
#ÿ��һ 1�㿪ʼ�������ݿ�
0 1 * * 1 /backup/dbbak.sh 2>&1 >>/backup/dbbak.log

