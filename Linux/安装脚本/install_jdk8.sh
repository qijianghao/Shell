#!/bin/bash
if [ ! -f jdk-8u66-linux-x64.rpm ];then
wget -c http://image2.bjhongru.com/Software/Java/jdk-8u66-linux-x64.rpm
fi
rpm -ivh jdk-8u66-linux-x64.rpm

echo '' >> /etc/profile
echo 'JAVA_HOME=/usr/java/latest/' >> /etc/profile
echo 'PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
echo 'CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar' >> /etc/profile
echo 'export JAVA_HOME PATH CLASSPATH' >> /etc/profile
source /etc/profile