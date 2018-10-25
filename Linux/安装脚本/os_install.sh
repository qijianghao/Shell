#!/bin/bash

yum -y install wget vim lrzsz curl epel-release bash-completion

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
sed -i 's/HISTSIZE=1000/HISTSIZE=5000/' /etc/profile
echo 'HISTTIMEFORMAT="%F %T `whoami` "' >>/etc/profile
source /etc/profile
touch /root/.bash_history
chattr +a /root/.bash_history

echo -e '* soft nofile 65535\n* hard nofile 65535\n* soft nproc 65535\n* hard nproc 65535' >>/etc/security/limits.conf

mv /etc/sysctl.conf /etc/sysctl.conf.bak
echo -e '# Aliyun sysctl config 2018.08\n\nnet.ipv6.conf.all.disable_ipv6 = 1\nnet.ipv6.conf.default.disable_ipv6 = 1\nnet.ipv6.conf.lo.disable_ipv6 = 1\n\nvm.swappiness = 0\nnet.ipv4.neigh.default.gc_stale_time=120\n
\n# see details in https://help.aliyun.com/knowledge_detail/39428.html\nnet.ipv4.conf.all.rp_filter=0\nnet.ipv4.conf.default.rp_filter=0\nnet.ipv4.conf.default.arp_announce = 2\nnet.ipv4.conf.lo.arp_announce=2\nnet.ipv4.conf.all.arp_announce=2\n
\n# see details in https://help.aliyun.com/knowledge_detail/41334.html\nnet.ipv4.tcp_max_tw_buckets = 5000\nnet.ipv4.tcp_syncookies = 1\nnet.ipv4.tcp_max_syn_backlog = 20480\nnet.ipv4.tcp_synack_retries = 2\nkernel.sysrq = 1\nfs.file-max=65535\nnet.core.somaxconn = 20480\nvm.overcommit_memory = 1' > /etc/sysctl.conf
sysctl -p
