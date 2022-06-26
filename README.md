# command-cookbook
## listen tcp
        
    netcat -u host port
## Docker
docker copy file from image to host

    docker run --rm --entrypoint cat yourimage  /path/to/file > path/to/destination
docker cp

    docker cp ./some_file CONTAINER:/work
    docker cp CONTAINER:/var/logs/ /tmp/app_logs
    docker cp CONTAINER:/var/logs/app.log - | tar x -O | grep "ERROR"
## SSH TUNNEL
        
    ssh -L <local:port>:<remote:port> root@<server-ip> -N 
## ufw
    ufw allow <port>,<port>,.../<protocol>
    ufw allow <from-port>:<to-port>/<protocol>
    ufw allow from <ip>
    ufw delete allow from <ip>
    systemctl enable ufw
## DNS lookup
    nslookup <domain> <dns>
    dig <domain> @<dns> +short
dns 
- quad9 
    - 9.9.9.9
- google 
    - 8.8.8.8 
    - 8.8.4.4
- cloudflare 
    - 1.1.1.1 
    - 1.0.0.1
- shecan
    - 178.22.122.100
    - 185.51.200.2
    - free.shecan.ir
    - https://free.shecan.ir/dns-query
## lvm
    growpart /dev/sdc <n>
    pvresize /dev/sdc<n>
    lvresize -l+100%FREE /dev/mapper/vg2-lv_varlibdocker
    resize2fs /dev/vg2/lv_varlibdocker
## user
### login as root
    sudo -i
### login as another user
    su -l <user>
