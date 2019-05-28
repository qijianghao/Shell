rem 异地备份Java svn代码备份
set time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set destpath=Z:\
set sourcepath=E:\Backup\SVN\
set dirname=Java_SVN

cd /d %destpath%
mkdir %destpath%%dirname%\%time%
xcopy %sourcepath%%time% %destpath%%dirname%\%time%


rem 异地备份ASP.NET_2015代码备份
set time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set destpath2=Z:
set sourcepath2=D:\Backup\Asp.Net_2015
set dirname2=ASP.NET_2015

cd /d %destpath2%
mkdir %destpath2%\%dirname2%\%time%
xcopy %sourcepath2%\%time% %destpath2%\%dirname2%\%time%


rem 异地备份ASP.NET_2016代码备份
set time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set destpath3=Z:
set sourcepath3=D:\Backup\ASP.Net_2016
set dirname3=ASP.Net_2016

cd /d %destpath3%
mkdir %destpath3%\%dirname3%\%time%
xcopy %sourcepath3%\%time% %destpath3%\%dirname3%\%time%


rem 异地备份Mssql 数据库备份
set time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set destpath4=Z:
set sourcepath4=D:\Backup\Mssql
set dirname4=Mssql

cd /d %destpath4%
mkdir %destpath4%\%dirname4%\%time%
xcopy %sourcepath4%\%time% %destpath4%\%dirname4%\%time%



rem 异地备份Mysql 数据库备份
set time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set destpath5=Z:
set sourcepath5=D:\Backup\Mysql
set dirname5=Mysql

cd /d %destpath5%
mkdir %destpath5%\%dirname5%\%time%
xcopy %sourcepath5%\%time% %destpath5%\%dirname5%\%time%