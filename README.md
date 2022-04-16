# command-cookbook
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
