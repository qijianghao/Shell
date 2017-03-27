echo 正在备份 Oracle 数据库，请稍等…… 

expdp ht/r8RtKZMWhGIt@orcl directory=dumpdir dumpfile=ht.bak.%date:~0,4%%date:~5,2%%date:~8,2%.dmp logfile=ht.bak.%date:~0,4%%date:~5,2%%date:~8,2%.log
expdp ht_en/VdiEL3hOUGaE@orcl directory=dumpdir dumpfile=ht_en.bak.%date:~0,4%%date:~5,2%%date:~8,2%.dmp logfile=ht_en.bak.%date:~0,4%%date:~5,2%%date:~8,2%.log
forfiles /p "E:\app\dumpdir" /m *.log /d -60 /c "cmd /c del @path" 
echo 任务完成!