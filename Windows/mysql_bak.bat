echo 正在备份 Mysql 数据库，请稍等…… 
:: 设置变量
set MysqldumpPath=D:\Program Files\Huweishen.com\PHPWEB\mysql\bin\mysqldump.exe
set Time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set Backpath=D:\Backup\Mysql
set Databases=wenyi wenyi2017 wenyi2017linetest wydy
set USER=root
set PASSWD=sysadmin123

:: 进入备份目录创建当前日期文件夹
cd /d %Backpath%
mkdir %Time%

:: 关闭屏幕输出
@echo off

:: for循环备份多个数据库
for %%D in (%Databases%) do (
"%MysqldumpPath%" -hlocalhost --opt -u%USER% -p%PASSWD% %%D > %Backpath%\%Time%\%%D_%Time%.sql 2>nul
)

forfiles /p "%Backpath%" /s /m *.sql /d -30 /c "cmd /c del @path"
for /f "tokens=*" %a in ('dir /b /ad /s %Backpath%^|sort /r') do rd "%a" /q 2>nul
echo 任务完成!