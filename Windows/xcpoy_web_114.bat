rem 可以配合定时执行文件打包，xcopy备份到本机的文件到备份服务器的共享目录
cd /d Y:\Tomcat-C
mkdir %date:~0,10%
Xcopy F:\backup\Tomcat-C\%date:~0,10% Y:\Tomcat-C\%date:~0,10%  /s /e /y
cd /d Y:\Tomcat-D
mkdir %date:~0,10%
Xcopy F:\backup\Tomcat-D\%date:~0,10% Y:\Tomcat-D\%date:~0,10%  /s /e /y