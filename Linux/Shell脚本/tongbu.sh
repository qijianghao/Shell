#/bin/bash
UNISON=`ps -ef |grep -v grep|grep -c inotifywait`
if [ ${UNISON} -lt 1 ]
then
cd /root/.unison/
Path=/www/website/ROOT/upload
/usr/bin/inotifywait -mrq -e create,move,delete,modify,attrib $Path | while read line; do
/usr/bin/unison default.prf
echo -n "$line" >> /var/log/inotify.log
echo `date | cut -d " " -f1-4` >> /var/log/inotify.log
done
fi


default.prf
root = /www/website/ROOT/upload
root = ssh://101.200.138.132//www/website/ROOT/upload
force =
#ignore = Path 
batch = true
owner = true
group = true
perms = -1
fastcheck= true
rsync = false
#debug=verbose
sshargs = -C
xferbycopying = true
#confirmbigdel = false
log = true
logfile = /root/tongbu.log