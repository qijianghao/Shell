#!/bin/bash
yum remove -y pcre-8.32-15.el7_2.1.i686
yum -y install gcc gcc-c++ autoconf automake wget zlib zlib-devel openssl openssl-devel pcre-devel pcre gd-devel bzip2 centos-release
groupadd www && useradd -g www www -s /sbin/nologin

if [ ! -f jemalloc-5.0.1.tar.bz2 ];then
wget -c wget http://image2.bjhongru.com/Software/Java/jemalloc-5.0.1.tar.bz2
fi
tar xjf jemalloc-5.0.1.tar.bz2
cd jemalloc-5.0.1
./configure && make && make install
echo '/usr/local/lib' > /etc/ld.so.conf.d/local.conf
ldconfig

cd ../
if [ ! -f tengine-2.2.1.tar.gz ];then
wget -c wget http://tengine.taobao.org/download/tengine-2.2.1.tar.gz
fi
tar zxf tengine-2.2.1.tar.gz
cd tengine-2.2.1
./configure --user=www --group=www --with-jemalloc --prefix=/usr/local/nginx --with-http_ssl_module --with-http_gzip_static_module --with-http_stub_status_module --with-http_concat_module --with-pcre --with-http_sysguard_module --with-http_realip_module --with-http_image_filter_module
make && make install
cd /usr/local/nginx/conf/
mv nginx.conf nginx.conf.bak

if [ ! -f nginx.conf ];then
wget http://image2.bjhongru.com/Software/Java/nginx.conf
fi

if [ `rpm -q centos-release|cut -d- -f3` -eq 7 ];then
 cd /lib/systemd/system/
 if [ ! -f nginx.service ];then
 wget http://image2.bjhongru.com/Software/Java/nginx.service
 fi

 chmod 745 /lib/systemd/system/nginx.service
 systemctl enable nginx.service
 systemctl restart nginx.service
  
elif [ `rpm -q centos-release|cut -d- -f3` -eq 6 ];then
  cd /etc/init.d/
  if [ ! -f nginx ];then
  wget -O nginx http://image2.bjhongru.com/Software/Java/nginx_Tengine
  fi
  
  chmod a+x /etc/init.d/nginx
  chkconfig nginx on
  service nginx restart
fi