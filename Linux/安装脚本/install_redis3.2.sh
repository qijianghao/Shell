#!/bin/bash
if [ ! -f redis-3.2.11.tar.gz ];then
wget -c http://download.redis.io/releases/redis-3.2.11.tar.gz
fi
tar -zxf redis-3.2.11.tar.gz
yum install -y gcc gcc-c++ pcre zlib pcre-devel tcl
cd redis-3.2.11
make && cd src &&make test
make install

mkdir /etc/redis && cd /etc/redis
if [ ! -f redis.conf ];then
wget -O 6379.conf http://image2.bjhongru.com/Software/Java/redis.conf
fi

sed -i 's/net.ipv4.tcp_max_syn_backlog = 1024/net.ipv4.tcp_max_syn_backlog = 20480/g' /etc/sysctl.conf
echo 'net.core.somaxconn = 20480' >> /etc/sysctl.conf
echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
sysctl -p

cd /etc/init.d/
if [ ! -f redis ];then
wget -c http://image2.bjhongru.com/Software/Java/redis
fi
chmod a+x /etc/init.d/redis
chkconfig redis on
/etc/init.d/redis restart