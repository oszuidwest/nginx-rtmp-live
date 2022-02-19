# Remove and stop old container
docker stop livestream
docker rm livestream

# Get and save nginx configuration
wget https://raw.githubusercontent.com/oszuidwest/nginx-rtmp-live/main/nginx.conf -O /root/nginx.conf
wget https://raw.githubusercontent.com/oszuidwest/nginx-rtmp-live/main/rebroadcast.conf -O /root/rebroadcast.conf

# Start new container
docker run -it \
  --restart unless-stopped \
  --name livestream \
  -p 1935:1935 -p 80:80 -p 443:443 \
  --mount type=bind,source="/root/nginx.conf",target="/etc/nginx/nginx.conf.template" \
  --mount type=bind,source="/root/rebroadcast.conf",target="/etc/nginx/rebroadcast.conf" \
  --mount type=bind,source="/etc/letsencrypt/live/live.zuidwesttv.nl/privkey.pem",target="/opt/certs/live.zuidwesttv.nl.key" \
  --mount type=bind,source="/etc/letsencrypt/live/live.zuidwesttv.nl/fullchain.pem",target="/opt/certs/live.zuidwesttv.nl.crt" \
  alfg/nginx-rtmp

# Do some clean-up after start
docker exec livestream touch /www/static/index.html
docker exec livestream rm /www/static/player.html
