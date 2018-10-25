#!/bin/sh
#usage: 2 * * * * root /root/httpd-restart.sh >>/root/httpd-restart.log
if [ `pgrep httpd | wc -l` -ge 400 ]
then
/alidata/server/httpd/bin/apachectl restart
echo "AutoStart:" $(date +"%y-%m-%d %H:%M:%S") "restart httpd" `ps -ef | grep httpd | wc -l`
fi


#!/bin/sh
ps -ef | grep 'java' | grep -v grep| awk '{print $2}' | xargs kill -9
sleep 3
/etc/init.d/tomcat start


@echo off

title 正在监控 ccag.cn
echo 正在监控 ccag.cn...
:aaa
set str="0"
cd /d D:\Tools\site-status
curl -o /dev/null -s -m 10 --connect-timeout 10 -w %{http_code} "http://www.ccag.cn/news.do?action=detail&id=201808240905488825" >check.txt
set /p str=<check.txt
if not "%str%"=="200" ( 
 echo 在%date% %time:~0,5% 无法正常访问，重启中...
 echo 在%date% %time:~0,5% 重启成功
 echo 正在监控ccag.cn...
)
sleep 60
goto aaa