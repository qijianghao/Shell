rem 异地备份Mssql 数据库备份
set time=%date:~0,4%-%date:~5,2%-%date:~8,2%
set ftp_host=
set ftp_port=21
set ftp_user=
set ftp_passwd=

set sourcepath=D:\Backup\Mysql
set destpath=192.168.1.7
set dirname=Mysql

@echo Off
echo open %ftp_host% %ftp_port%>ftp.up
echo %ftp_user%>>ftp.up
echo %ftp_passwd%>>ftp.up
echo prompt off>>ftp.up
echo binary>>ftp.up
echo lcd %sourcepath%>>ftp.up
echo cd %destpath%>>ftp.up
echo mkdir %dirname%>>ftp.up
echo cd %dirname%>>ftp.up
echo mkdir %time%>>ftp.up
echo cd %time%>>ftp.up
echo mput %time%\*>>ftp.up
echo prompt on >>ftp.up
echo bye >>ftp.up
echo quit >>ftp.up

ftp -s:ftp.up

rem 异地备份Mssql 数据库备份
set sourcepath=D:\Backup\Mssql
set destpath=192.168.1.7
set dirname=Mssql

@echo Off
echo open %ftp_host% %ftp_port%>ftp.up
echo %ftp_user%>>ftp.up
echo %ftp_passwd%>>ftp.up
echo prompt off>>ftp.up
echo binary>>ftp.up
echo lcd %sourcepath%>>ftp.up
echo cd %destpath%>>ftp.up
echo mkdir %dirname%>>ftp.up
echo cd %dirname%>>ftp.up
echo mkdir %time%>>ftp.up
echo cd %time%>>ftp.up
echo mput %time%\*>>ftp.up
echo prompt on >>ftp.up
echo bye >>ftp.up
echo quit >>ftp.up

ftp -s:ftp.up