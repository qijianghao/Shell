rem 设置变量
set Time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set MysqldumpPath=D:\mysql\bin\mysqldump.exe
set Backpath=E:\backup\mysql

rem 数据库名称 只支持单个数据库
set Databases=DB_NAME
set HOST="127.0.0.1"
set USER=root
set PASSWD=PASSWD

rem 关闭屏幕输出
@echo off

rem 备份数据库
"%MysqldumpPath%" -h%HOST% --opt -u%USER% -p%PASSWD% %Databases% > %Backpath%\%Databases%_%Time%.sql