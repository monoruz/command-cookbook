# Resources
## bandwidth monitor
```
iftop -i eth0 -f 'dst host 1.1.1.1 and dst port 443'
```
t: toggle oneline in host or only recieve
T: cummulative ?
## port used and kill
    lsof -i :<port>
    kill -9 $(lsof -i :<port> | awk '{print$2}'
## port scan 
    nmap <host> -Pn -p <tcp port>
    nmap <host> -sU -p <udp port>
##  run without log
    sleep 30 &
    jobs
    echo $! > /tmp/process.pid
## kill signals
- 9 force
- 15 terminate
## listen on netcat
    netcat -l <port> > <file>
    netcat -lu <port> > <file> #udp
    netcat <domain> <port> < <file>
    while true; do printf 'HTTP/1.1 200 OK\n\n%s' "$(cat index.html)" | netcat -l 8888; done
## fuser
```bash
fuser -v -n tcp <port> 
fuser -k 80/tcp
```
## portforward
```
[Unit]
Description=Persistent SSH Reverse Tunnel
After=network.target

[Service]
ExecStart=/usr/bin/ssh -NT \
    -o ExitOnForwardFailure=yes \
    -o ServerAliveInterval=60 \
    -R 0.0.0.0:9000:localhost:8000 user@remote.server
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```
