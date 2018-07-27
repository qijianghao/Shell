#!/bin/sh
file1=$(find '/alidata/log/httpd/' -ctime -7 -name 'www.skp-beijing.com_access_*.log' -exec cat {} \;|grep .pdf|grep 'HTTP/1.1" 200'|wc -l)
file2=$(find '/alidata/log/httpd/' -ctime -7 -name 'www.skp-beijing.com_access_*.log' -exec cat {} \;|grep /pdf|grep 'HTTP/1.1" 200'|wc -l)
file3=$(find '/alidata/log/httpd/' -ctime -7 -name 'www.skp-beijing.com_access_*.log' -exec cat {} \;|grep xba.pdf|grep 'HTTP/1.1" 200'|wc -l)
data=$[file1-file2-file3]
startime=$(date -d '7 days ago' "+%Y%m%d")
stoptime=`date +"20%y%m%d"`
echo '<meta charset="utf-8">' >>/alidata/www/www.skp-beijing.com/pdf_count.html
echo '统计周期(7天):'$startime-$stoptime >>/alidata/www/www.skp-beijing.com/pdf_count.html && echo "</br>" >>/alidata/www/www.skp-beijing.com/pdf_count.html
echo 'PDF访问量:'$file1-$file2-$file3=$data >>/alidata/www/www.skp-beijing.com/pdf_count.html && echo "</br>" >>/alidata/www/www.skp-beijing.com/pdf_count.html
echo  >>/alidata/www/www.skp-beijing.com/pdf_count.html && echo "</br>" >>/alidata/www/www.skp-beijing.com/pdf_count.html
echo  >>/alidata/www/www.skp-beijing.com/pdf_count.html && echo "</br>" >>/alidata/www/www.skp-beijing.com/pdf_count.html
