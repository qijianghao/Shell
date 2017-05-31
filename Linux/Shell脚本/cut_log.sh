#!/bin/bash
#设置日志文件存放目录
logs_path="/usr/local/nginx/logs/"
mv ${logs_path}access.log ${logs_path}access_$(date -d "yesterday" +"%Y%m%d").log
/usr/local/nginx/sbin/nginx -s reopen
