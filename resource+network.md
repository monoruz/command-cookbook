# Resources
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
    netcat -l <port>
