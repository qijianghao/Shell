#!/bin/bash
Time=`date +"%y-%m-%d %H:%M"`
Mail_from=qijianghao@163
Mail_passwd=wanqjh789.
Mail_to=296985168@qq.com
smtp_address=smtp.163.com
bak_name=171_webbak_2018

sendEmail -f qijianghao@163.com -t 296985168@qq.com -s smtp.163.com -xu qijianghao@163.com -xp *** -u "$bak_name异地备份已完成。" -m "通知邮件: $bak_name 已在$Time 备份完成,请知晓."
