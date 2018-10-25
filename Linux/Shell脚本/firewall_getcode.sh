#!/bin/bash
access_log=/home/wwwlogs/hecom.cn.log
getcode_count=$(cat $access_log |grep getcode|awk '{print $1}'|sort |uniq -c|sort -rn|awk '{print $1}')
iptables -F
echo >./getcode_count.txt
for g in $getcode_count
	do
		if [[ $g -gt 30 ]];then
			echo $g >>./getcode_count.txt
		fi
    done
black_count=$(cat ./getcode_count.txt|wc -l)
black_count2=$(($black_count-1))
black_ip=$(cat $access_log |grep getcode|awk '{print $1}'|sort |uniq -c|sort -rn|awk '{print $2}'|head -$black_count2)
echo $black_count2
for b in $black_ip
	do
		if [[ $b != "124.205.165.218" ]];then
			iptables -I INPUT -s $b -p tcp -m tcp --dport 80 -j REJECT
		fi
	done
