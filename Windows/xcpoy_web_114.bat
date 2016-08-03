cd /d Y:\Tomcat-C
mkdir %date:~0,10%
Xcopy F:\backup\Tomcat-C\%date:~0,10% Y:\Tomcat-C\%date:~0,10%  /s /e /y
cd /d Y:\Tomcat-D
mkdir %date:~0,10%
Xcopy F:\backup\Tomcat-D\%date:~0,10% Y:\Tomcat-D\%date:~0,10%  /s /e /y