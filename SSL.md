# SSL
## check certfile
```bash
openssl x509 -text -noout -in cert.pem
```
## check cert of website
```bash
openssl s_client -connect www.homeca.ir:443
```
## generete letsencrypt
### DNS
```bash
certbot certonly --manual --preferred-challenges dns -d '*.a.com'
```
