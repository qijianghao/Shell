@echo off
netstat -ano|findstr 0.0.0.0 |findstr :80 |findstr LISTENING > null

if errorlevel 1 (
    echo �˿�δ����
    net stop iisadmin
	net stop w3svc
	net start iisadmin
	net start w3svc
)
if errorlevel 0 (
    echo �˿��ѿ���
)


@echo off
tasklist  |findstr w3wp.exe > null

if errorlevel 1 (
    echo �˿�δ����
    net stop iisadmin
	net stop w3svc
	net start iisadmin
	net start w3svc
)
if errorlevel 0 (
    echo �˿��ѿ���
)