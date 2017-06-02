#!/bin/bash
#设置日志文件存放目录
logs_path="/alidata/log/nginx/access"
Nginx_path="/alidata/server/nginx-1.4.4/sbin"
mv ${logs_path}/www_access.log ${logs_path}/www_access_$(date -d "yesterday" +"%Y%m%d").log
$Nginx_path/nginx -s reopen