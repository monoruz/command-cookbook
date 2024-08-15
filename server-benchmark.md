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
## upload speedtest (NON-IR)
```
iperf3 -c 169.150.242.129 -l 500000 -P5
```
## intraserver speed
```
iperf3 -c <host> -p <port> 
```
## hard speed
```
dd if=/dev/zero of=/root/testfile bs=1G count=1 oflag=dsync
dd if=/dev/zero of=/root/testfile bs=512 count=1000 oflag=direct
```
