#!/bin/bash
if [ `rpm -qa|grep jdk|wc -l` -eq 0 ];then
  if [ ! -f jdk-8u66-linux-x64.rpm ];then
  wget -c http://image2.bjhongru.com/Software/Java/jdk-8u66-linux-x64.rpm
  rpm -ivh jdk-8u66-linux-x64.rpm
  echo '' >> /etc/profile
  echo 'JAVA_HOME=/usr/java/latest/' >> /etc/profile
  echo 'PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
  echo 'CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar' >> /etc/profile
  echo 'export JAVA_HOME PATH CLASSPATH' >> /etc/profile
  source /etc/profile
    fi
    fi


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
