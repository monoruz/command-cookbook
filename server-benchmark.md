# Server Benchmark
## Total benchmark
```
curl -L https://raw.githubusercontent.com/masonr/yet-another-bench-script/master/yabs.sh |bash
```
## intenet speed
```
wget https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
python3 speedtest.py
```
## intraserver speed
    iperf3 -c <host> -p <port> 
## hard speed
    dd if=/dev/zero of=/root/testfile bs=1G count=1 oflag=dsync
    dd if=/dev/zero of=/root/testfile bs=512 count=1000 oflag=direct
