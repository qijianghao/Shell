:: 清理IIS日志文件 注 文件另存为 bat
:: 备份MySql数据库
@echo off
title 清理IIS日志文件
 
:: IIS日志文件目录
set log_dir="C:\inetpub\logs\LogFiles"
 
:: 保留日志天数
set bak_dat=30
 
:: 删除日志文件
forfiles /p %log_dir% /S /M *.log /D -%bak_dat% /C "cmd /c echo 正在删除@relpath 文件… & echo. & del @file"