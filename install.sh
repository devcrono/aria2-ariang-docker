#! /bin/sh -eux

ariang_version=1.3.6

ariang_file=AriaNg-${ariang_version}.zip

groupadd junv \
  && useradd -g junv -m -s /bin/bash junv \
  && apt update \
  && apt install --no-install-recommends -y wget curl aria2 tar unzip libcap2-bin ca-certificates  runit\
  && mkdir -p /usr/local/www/aria2 \
  && curl -s https://i.jpillora.com/divyam234/forego | bash \
  && curl -s https://i.jpillora.com/divyam234/rclone! | bash \
  && curl -s https://i.jpillora.com/divyam234/filebrowser | bash \
  && curl -s https://i.jpillora.com/caddyserver/caddy! | bash \
  && curl -s https://i.jpillora.com/ginuerzh/gost!?as=gost | bash \
  && curl -s https://i.jpillora.com/bhunter17/foundation-source!?as=mkclean | bash \
  && curl -s  "$UPLOADER" -o uploader.zip \
  && unzip uploader.zip && chmod 755 uploader && mv uploader  /usr/local/bin/uploader \
  && rm -rf uploader.zip \
  && chown -R junv:junv /usr/local/bin \
  && mkdir /usr/local/www/aria2/Download \
  && cd /usr/local/www/aria2 \
  && chmod +rw /app/conf/aria2.session \
  && wget -q -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/${ariang_version}/${ariang_file} \
  && unzip ${ariang_file} \
  && rm -rf ${ariang_file} \
  && chmod -R 755 /usr/local/www/aria2 \
  && mkdir -p /data && chown junv:junv /data \
  && mkdir -p /data/cloud \
  && chown junv:junv /data/cloud \
  && ln -s /data/cloud /app \
  && update-ca-certificates \
  && apt clean
