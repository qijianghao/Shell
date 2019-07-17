#!/bin/bssh
yum -y install telnet-server
sed -i s/yes/no/g /etc/xinetd.d/telnet
echo -e "pts/0\npts/1" >> /etc/securetty
service xinetd start
yum -y install gcc zlib-devel openssl-devel
mv  /etc/ssh/ /etc/ssh.bak
wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.7p1.tar.gz
tar zxf openssh-7.7p1.tar.gz
cd openssh-7.7p1
./configure --prefix=/usr --sysconfdir=/etc/ssh
make && make install
mv /etc/init.d/sshd /root/sshd.bak
cp /root/openssh-7.7p1/contrib/redhat/sshd.init /etc/init.d/sshd
chkconfig --add sshd
chkconfig sshd on
echo -e "PermitRootLogin yes\nPasswordAuthentication yes" >>/etc/ssh/sshd_config
setenforce 0
service sshd restart
service xinetd stop
ssh -V
