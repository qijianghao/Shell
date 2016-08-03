cd /d Z:\crm_web
mkdir %date:~0,10%
"C:\Program Files\WinRAR\WinRAR.exe" a -ag -r -m4 -v1024m Z:\crm_web\%date:~0,10%\crm_web_bak%d%.rar @f:\backup\web\webbackup.txt