#!/bin/bash
Webdir='/abc.com/'
Bakdir='/backup/web/'
Bakname='abc.com'
Date=`date +"%y-%m-%d"`
mkdir -p $Bakdir/$Date
cd $Bakdir/$Date
tar zcf $Bakname-$Date.tar.gz $Webdir

    #保留60天备份文件
    find $Bakdir -mtime +60 -name "*.tar.gz" -exec rm -rf {} \;
    #删除空目录
    find $Bakdir -type d -empty -exec rmdir {} \;