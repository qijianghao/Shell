:: ����IIS��־�ļ� ע �ļ����Ϊ bat
:: ����MySql���ݿ�
@echo off
title ����IIS��־�ļ�
 
:: IIS��־�ļ�Ŀ¼
set log_dir="C:\inetpub\logs\LogFiles"
 
:: ������־����
set bak_dat=30
 
:: ɾ����־�ļ�
forfiles /p %log_dir% /S /M *.log /D -%bak_dat% /C "cmd /c echo ����ɾ��@relpath �ļ��� & echo. & del @file"