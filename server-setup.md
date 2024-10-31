# server setup
## Fish Activate
```bash
apt-add-repository ppa:fish-shell/release-3
apt install fish
chsh -s /usr/bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf themes theme
omf install https://github.com/dracula/fish
```
## rsync
```
rsync -avz --delete /var/lib/caddy/ user@destination_server:/var/lib/caddy/
```
## fail2ban
```
apt install fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
nano /etc/fail2ban/jail.local

#bantime=2h
#maximumretry = 3
# [sshd] 
# enabled = true

systemctl enable fail2ban

systemctl start fail2ban

fail2ban-client status sshd
```
## otel
```
curl -LO https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.107.0/otelcol-contrib_0.107.0_linux_amd64.deb
dpkg -i otelcol-contrib_0.107.0_linux_amd64.deb
wget tange.mn-service.ir/97207389/otelcol.config.yml -O /etc/otelcol-contrib/config.yaml
nano /lib/systemd/system/otelcol-contrib.service
```
## caddy
```
cd /tmp/
curl -LO https://github.com/caddyserver/caddy/releases/download/v2.8.4/caddy_2.8.4_linux_amd64.deb
sudo dpkg -i caddy_2.8.4_linux_amd64.deb
rm caddy_2.8.4_linux_amd64.deb
wget https://repo.s3.ir-thr-at1.arvanstorage.ir/caddy
chmod +x caddy
mv caddy /usr/bin/caddy
cd /etc/caddy/
curl -LO tange.mn-service.ir/97207389/Caddyfile
mkdir conf.d
cd conf.d
curl -LO tange.mn-service.ir/97207389/health.conf
curl -LO tange.mn-service.ir/97207389/speedtest.conf
curl -L ui.mn-service.ir/usage/caddy/ -o v2ray.conf
nano /usr/lib/systemd/system/caddy.service
```
## docker-compose setup
 ```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

systemctl enable docker
systemctl start docker
```
## nginx
```
apt install nginx -y
systemctl enable nginx
systemctl start nginx
```
## ssh config
```
cd /etc/ssh/
nano sshd_config
#permitrootlogin -> no
#ssh port 22 -> ?
# clientaliveinterval 100
systemctl restart sshd
```
## ufw 
```
apt install ufw -y
systemctl enable ufw
ufw enable
ufw allow 80,443,22/tcp
ufw status
```
## gitlab runner
```
wget https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 -O  /usr/local/bin/gitlab-runner
chmod +x  /usr/local/bin/gitlab-runner
mkdir /home/gitlab-runner
gitlab-runner install --user=root --working-directory=/home/gitlab-runner
gitlab-runner start
```
## add runner to sudoers with no passwd
```
echo 'github-runner ALL=(ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo
```
## permission denied problem
```
sudo usermod -a -G docker <user>
```
## gitlab runner debug
```
gitlab-runner --debug run
```
## mc
```
wget https://dl.min.io/client/mc/release/linux-amd64/mc  -O  /usr/local/bin/mc
chmod +x  /usr/local/bin/mc
```
## traefik
```bash
mkdir -p /etc/traefik
mkdir -p /etc/traefik/conf.d
cd /etc/traefik
wget https://github.com/traefik/traefik/releases/download/v2.9.6/traefik_v2.9.6_linux_amd64.tar.gz
tar -xzvf traefik_v2.9.6_linux_amd64.tar.gz
rm traefik_v2.9.6_linux_amd64.tar.gz CHANGELOG.md LICENSE.md
mv traefik /usr/local/bin/
chmod +x /usr/local/bin/traefik
wget https://tange.s3.ir-thr-at1.arvanstorage.ir/97207389/traefik.service -O /etc/systemd/system/traefik.service
wget https://tange.s3.ir-thr-at1.arvanstorage.ir/97207389/traefik.yml -O /etc/traefik/traefik.yml

wget https://tange.s3.ir-thr-at1.arvanstorage.ir/97207389/middleware.yml -O /etc/traefik/conf.d/middleware.yml

systemctl enable traefik
systemctl restart traefik
systemctl status traefik
```
## CoreDNS
```bash
cat /etc/resolv.conf > /etc/resolv.conf.bk
cat /etc/resolv.conf.bk > /etc/resolv.conf
mkdir -p /etc/coredns
cd /etc/coredns
wget https://github.com/coredns/coredns/releases/download/v1.11.1/coredns_1.11.1_linux_amd64.tgz
tar -xzf coredns_1.11.1_linux_amd64.tgz
rm coredns_1.11.1_linux_amd64.tgz
mv coredns /usr/local/bin/
chmod +x /usr/local/bin/coredns
wget https://tange.s3.ir-thr-at1.arvanstorage.ir/97207389/coredns.service -O /etc/systemd/system/coredns.service
wget https://tange.s3.ir-thr-at1.arvanstorage.ir/97207389/core.dns -O /etc/coredns/core.dns
```
## v2ray
install
```bash
curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-dat-release.sh | bash
wget https://tange.mn-service.ir/alborz/alborz.mnse.store -O /usr/local/etc/v2ray/alborz.mnse.store
systemctl restart v2ray@alborz.mnse.store
```
uninstall 
```
curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash --remove
```
## disable ipv6
```
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
```
