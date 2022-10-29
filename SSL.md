# SSL
## check certfile
```console
openssl x509 -text -noout -in cert.pem
```
## check cert of website
```console
openssl s_client -connect www.homeca.ir:443
```
## generete letsencrypt
### DNS
```console
certbot certonly --manual --preferred-challenges dns -d '*.a.com'
```
