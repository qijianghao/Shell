rem 设置变量
set Time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set MysqldumpPath=D:\mysql\bin\mysqldump.exe
set Backpath=E:\backup\mysql
set Databases=DB_NAME DB_NAME_2 DB_NAME_3 DB_NAME_4
set HOST="127.0.0.1"
set USER=root
set PASSWD=PASSWD

rem 进入备份目录创建当前日期文件夹
cd /d %Backpath%
mkdir %Time%

rem 关闭屏幕输出
@echo off

rem for循环备份多个数据库
for %%D in (%Databases%) do (
"%MysqldumpPath%" -h%HOST% --opt -u%USER% -p%PASSWD% %%D > %Backpath%\%Time%\%%D_%Time%.sql 2>nul
)