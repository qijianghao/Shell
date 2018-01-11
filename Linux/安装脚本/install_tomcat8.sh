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

if [ ! -f apache-tomcat-8.5.24.tar.gz ];then
wget -c http://image2.bjhongru.com/Software/Java/apache-tomcat-8.5.24.tar.gz
fi
tar zxf apache-tomcat-8.5.24.tar.gz
mv apache-tomcat-8.5.24 /usr/local/tomcat
cd /usr/local/tomcat/conf/
mv server.xml server.xml.bak
wget -O server.xml http://image2.bjhongru.com/Software/Java/server-default.xml
cd /etc/init.d/
if [ ! -f tomcat ];then
wget -O tomcat http://image2.bjhongru.com/Software/Java/tomcat-default
fi

cd ~
wget http://image2.bjhongru.com/Software/Java/tomcat-restart.sh
chmod a+x /etc/init.d/tomcat
chkconfig tomcat on
service tomcat start
