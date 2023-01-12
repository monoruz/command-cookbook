# server setup
## docker-compose setup
 ```
 #Uninstall old versions
 sudo apt-get remove docker docker-engine docker.io containerd runc
 sudo apt-get update
 sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

systemctl enable docker
systemctl start docker

#docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
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
```
## mc
```
wget https://dl.min.io/client/mc/release/linux-amd64/mc  -O  /usr/local/bin/mc
chmod +x  /usr/local/bin/mc
```
