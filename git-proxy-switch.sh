proxy=socks5h://127.0.0.1:1080
value=$(git config --global --get http.proxy)
if [ -z "$value" ]
then
    git config --global http.proxy $proxy
else
    git config --global --unset http.proxy
fi