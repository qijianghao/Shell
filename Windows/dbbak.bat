
expdp orlwww/"""@)!!.)^.www"""@orcl schemas=orlwww dumpfile=orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.dmp LOGFILE=orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.log DIRECTORY=dumpdir



cd /d C:\Program Files\WinRAR
Rar m -ep D:\Backup\oracl_dbbak\orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.rar D:\app\dumpdir\orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.dmp
Rar m -ep D:\Backup\oracl_dbbak\orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.rar D:\app\dumpdir\orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.log

rem copy D:\app\dumpdir\orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.dmp D:\Backup\oracl_dbbak\orlwww%date:~0,4%-%date:~5,2%-%date:~8,2%.rar

rem del /Q D:\app\dumpdir\*.log
rem del /Q D:\app\dumpdir\*.DMP
rem del /Q D:\app\dumpdir\*.rar
forfiles /p "D:\Backup\oracl_dbbak" /s /m *.rar /d -45 /c "cmd /c del @path"