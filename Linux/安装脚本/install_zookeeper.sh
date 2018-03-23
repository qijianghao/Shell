#!/bin/bash
if [ ! -f zookeeper-3.4.11.tar.gz ];then
wget -c http://image2.bjhongru.com/Software/Java/zookeeper-3.4.11.tar.gz
fi
tar -zxf zookeeper-3.4.11.tar.gz
chown -R root.root zookeeper-3.4.11
mv zookeeper-3.4.11 /usr/local/zookeeper
cd /usr/local/zookeeper/conf/
cp zoo_sample.cfg zoo.cfg
mkdir -p /tmp/zookeeper
/usr/local/zookeeper/bin/zkServer.sh restart
echo "/usr/local/zookeeper/bin/zkServer.sh restart" >>/etc/rc.local
