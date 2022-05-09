# Resources
## port used and kill
    lsof -i :<port>
    kill -9 $(lsof -i :<port> | awk '{print$2}'
## port scan 
    nmap <host> -Pn -p <tcp port>
    nmap -sU <host> -p <udp port>
##  run without log
    sleep 30 &
    jobs
    echo $! > /tmp/process.pid
## kill signals
- 9 force
- 15 terminate

    
