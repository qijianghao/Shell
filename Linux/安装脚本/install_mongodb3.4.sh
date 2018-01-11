#!/bin/bash
yum install -y centos-release
if [ `rpm -q centos-release|cut -d- -f3` -eq 7 ];then
  cd /etc/yum.repos.d/
  wget http://image2.bjhongru.com/Software/Java/Mongdb-org-el7.repo
  cd -
  yum install mongodb-org -y
  sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf
  sed -i '/\#security:/a\  authorization\: enabled' /etc/mongod.conf
  sed -i '/\#security:/a\security\:' /etc/mongod.conf
  /bin/systemctl enable mongod.service
  /bin/systemctl restart mongod.service
  
elif [ `rpm -q centos-release|cut -d- -f3` -eq 6 ];then
  cd /etc/yum.repos.d/
  wget http://image2.bjhongru.com/Software/Java/Mongdb-org-el6.repo
  cd -
  yum install mongodb-org -y
  sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf
  sed -i '/\#security:/a\  authorization\: enabled' /etc/mongod.conf
  sed -i '/\#security:/a\security\:' /etc/mongod.conf

  chkconfig mongod on
  service mongod restart
fi
