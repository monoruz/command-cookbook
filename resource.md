# Resources
## port used and kill
    lsof -i :<port>
    kill -9 $(lsof -i :<port> | awk '{print$2}'
##  run without log
    sleep 30 &
    jobs
    echo $! > /tmp/process.pid
## kill signals
- 9 force
- 15 terminate

    
