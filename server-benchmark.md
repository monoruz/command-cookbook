# Server Benchmark
## intenet speed
    curl -Lo speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
    chmod +x speedtest-cli
    speedtest-cli
## intraserver speed
    iperf3 -c <host> -p <port> 
## hard speed
    dd if=/dev/zero of=/root/testfile bs=1G count=1 oflag=dsync
    dd if=/dev/zero of=/root/testfile bs=512 count=1000 oflag=direct
