# nginx-rtmp-live

Scripts to run a docker image that streams live tv. Based on the docker container [image alfg/nginx-rtmp](https://hub.docker.com/r/alfg/nginx-rtmp/). 

## How to run
- Install Debian 11
- Install Docker [using the official guide](https://docs.docker.com/engine/install/debian/)
- Install `certbot` and `python3-certbot-dns-cloudflare` with apt
- Download `stream.sh` and `ssl.sh`
- Replace hardcoded values in `stream.sh` and `ssl.sh`
- Run stream.sh
- When everything works, replace `docker run -it` with `docker run -d` in `stream.sh` to run the container in the background
