docker stop livestream
docker rm livestream

wget https://raw.githubusercontent.com/oszuidwest/nginx-rtmp-live/main/nginx.conf -O /root/nginx.conf.template

docker run -it \
  --restart unless-stopped \
  --name livestream \
  -p 1935:1935 -p 80:80 \
  --mount type=bind,source="/root/nginx.conf.template",target="/etc/nginx/nginx.conf.template" \
  alfg/nginx-rtmp
