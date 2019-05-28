rem 可以配合定时执行文件打包，xcopy命令复制本机的备份文件到远程服务器的共享目录
cd /d Y:\Tomcat-C
mkdir %date:~0,4%-%date:~5,2%-%date:~8,2%
Xcopy F:\backup\Tomcat-C\%date:~0,10% Y:\Tomcat-C\%date:~0,10%  /s /e /y
cd /d Y:\Tomcat-D
mkdir %date:~0,4%-%date:~5,2%-%date:~8,2%
Xcopy F:\backup\Tomcat-D\%date:~0,10% Y:\Tomcat-D\%date:~0,10%  /s /e /y