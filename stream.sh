docker stop livestream
docker rm livestream

wget https://raw.githubusercontent.com/oszuidwest/nginx-rtmp-live/main/nginx.conf -O /root/nginx.conf.template

docker run -it \
  --restart unless-stopped \
  --name livestream \
  -p 1935:1935 -p 80:80 -p 443:443 \
  --mount type=bind,source="/root/nginx.conf.template",target="/etc/nginx/nginx.conf.template" \
  --mount type=bind,source="/etc/letsencrypt/live/live.zuidwesttv.nl/privkey.pem",target="/opt/certs/live.zuidwesttv.nl.key" \
  --mount type=bind,source="/etc/letsencrypt/live/live.zuidwesttv.nl/fullchain.pem",target="/opt/certs/live.zuidwesttv.nl.crt" \
  alfg/nginx-rtmp
  
docker exec livestream touch /www/static/index.html
docker exec livestream rm /www/static/player.html
