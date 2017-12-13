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