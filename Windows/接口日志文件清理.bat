@echo off
title 清理接口日志文件
 
:: 接口日志文件
set log_dir="E:\Website\ASP.NET_2015\ShanShuiWY_en_g246tl\log\W3SVC6012"
 
:: 保留日志天数
set bak_dat=30
 
:: 删除日志文件
forfiles /p %log_dir% /S /M *.log /D -%bak_dat% /C "cmd /c echo 正在删除@relpath 文件… & echo. & del @file"