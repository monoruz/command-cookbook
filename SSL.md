# SSL
## check certfile
```zsh
openssl x509 -text -noout -in cert.pem
```
## check cert of website
```zsh
openssl s_client -connect www.homeca.ir:443
```
## generete letsencrypt
### DNS
```zsh
certbot certonly --manual --preferred-challenges dns -d '*.a.com'
```
