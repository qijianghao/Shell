rem 设置变量
set Time=%date:~0,10%
set MysqldumpPath=D:\xampp\mysql\bin\mysqldump.exe
set Backpath=E:\backup\mysql
set Databases=DB_NAME
set HOST="127.0.0.1"
set USER=root
set PASSWD=PASSWD

rem 关闭屏幕输出
@echo off

rem for循环备份多个数据库
"%MysqldumpPath%" -h%HOST% --opt -u%USER% -p%PASSWD% %Databases% > %Backpath%\%Time%\%%D_%Time%.sql