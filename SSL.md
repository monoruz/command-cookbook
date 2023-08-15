# SSL
## check certfile
```console
openssl x509 -text -noout -in cert.pem
```
## check cert of website
```console
openssl s_client -connect www.homeca.ir:443 -servername example.com -showcerts -no_tls1_3
```
## generete letsencrypt
### DNS
```console
certbot certonly --manual --preferred-challenges dns -d '*.a.com'
```
## generate selfsigned cert
- generate root cert
```console
openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem
openssl x509 -outform pem -in RootCA.pem -out RootCA.crt
```
- create extenstion for domain
```console
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:TRUE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = cluster.local
DNS.2 = *.cluster.local
```
- generate selfsigned cert
```console
openssl req -new -nodes -newkey rsa:2048 -keyout cluster.local.key -out cluster.local.csr
openssl x509 -req -sha256 -days 1024 -in cluster.local.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -extfile cluster.local.ext -out cluster.local.crt
```
