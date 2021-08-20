# nginx-rtmp-live

Scripts to run a docker image that streams live tv. Based on the docker container [image alfg/nginx-rtmp](https://hub.docker.com/r/alfg/nginx-rtmp/). It assumes you use Cloudflare for your domain and Let's Encrypt for SSL certificates.

## How to run
- Install Debian 11
- Install Docker [using the official guide](https://docs.docker.com/engine/install/debian/)
- Install `certbot` and `python3-certbot-dns-cloudflare` with apt
- Download `stream.sh`, `ssl.sh` and `cloudflare.ini`
- Replace hardcoded values in `stream.sh` and `ssl.sh`
- Enter your Cloudflare API Key in `cloudflare.ini`
- Run ssl.sh to get the https cert
- Run stream.sh to download and build the docker container
- When everything works, replace `docker run -it` with `docker run -d` in `stream.sh` to run the container in the background

⚠️ This setup let's everyone stream to the server. You should put a firewall in place to lock it down ⚠️
