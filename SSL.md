# SSL
## check cert
```bash
openssl x509 -text -noout -in cert.pem
```
## generete letsencrypt
### DNS
```bash
certbot certonly --manual --preferred-challenges dns -d '*.a.com'
```
