rem 屏蔽系统危险端口 137/138/139/445
netsh advfirewall firewall add rule name="deny udp 137" dir=in protocol=udp localport=137 action=block
netsh advfirewall firewall add rule name="deny udp 138" dir=in protocol=udp localport=138 action=block
netsh advfirewall firewall add rule name="deny udp 139" dir=in protocol=udp localport=139 action=block
netsh advfirewall firewall add rule name="deny udp 445" dir=in protocol=udp localport=445 action=block
netsh advfirewall firewall add rule name="deny tcp 137" dir=in protocol=tcp localport=137 action=block
netsh advfirewall firewall add rule name="deny tcp 138" dir=in protocol=tcp localport=138 action=block
netsh advfirewall firewall add rule name="deny tcp 139" dir=in protocol=tcp localport=139 action=block
netsh advfirewall firewall add rule name="deny tcp 445" dir=in protocol=tcp localport=445 action=block
rem 关闭屏幕输出
@echo off