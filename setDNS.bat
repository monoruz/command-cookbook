netsh interface ipv4 set dns "Ethernet" static 127.0.0.1
netsh interface ipv4 add dns "Ethernet" 10.1.8.11 index=2
pause
