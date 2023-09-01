#! /bin/sh -eux

echo "[INFO] Set variables for $(arch)"

caddy_version=2.7.4
filebrowser_version=v2.24.2
rclone_version=v1.64.0
ariang_version=1.3.6

case "$(arch)" in

   x86_64)
      platform=linux-amd64
      caddy_file=caddy_${caddy_version}_linux_amd64.tar.gz
      rclone_file=rclone-${rclone_version}-${platform}.zip
     ;;
   armv7l)
     platform=linux-armv7
     caddy_file=caddy_${caddy_version}_linux_armv7.tar.gz
     rclone_file=rclone-${rclone_version}-linux-arm-v7.zip
     ;;

   aarch64)
     platform=linux-arm64
     caddy_file=caddy_${caddy_version}_linux_arm64.tar.gz
     rclone_file=rclone-${rclone_version}-${platform}.zip
     ;;

   *)
     echo "[ERROR] unsupported arch $(arch), exit now"
     exit 1
     ;;
esac

filebrowser_file=${platform}-filebrowser.tar.gz
ariang_file=AriaNg-${ariang_version}.zip
groupadd junv \
  && useradd -g junv -m -s /bin/bash junv \
  && apt update \
  && apt install -y wget curl aria2 tar unzip libcap2-bin ca-certificates  runit\
  && wget -q -N https://github.com/caddyserver/caddy/releases/download/v${caddy_version}/${caddy_file} \
  && tar -zxf ${caddy_file} \
  && mv caddy /usr/local/bin/ \
  && rm -rf ${caddy_file} \
  && platform=linux-amd64 \
  && wget -q -N https://github.com/filebrowser/filebrowser/releases/download/${filebrowser_version}/${filebrowser_file} \
  && tar -zxf ${filebrowser_file} \
  && rm -rf ${filebrowser_file} \
  && rm LICENSE README.md CHANGELOG.md \
  && mkdir -p /usr/local/www \
  && mkdir -p /usr/local/www/aria2 \
  && rm -rf init /app/*.txt \
  && curl -s https://i.jpillora.com/divyam234/rclone!?as=rclone | bash \
  && chown junv:junv /usr/local/bin/rclone \
  && chmod 755 /usr/local/bin/rclone \
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
  && curl -s https://i.jpillora.com/ginuerzh/gost!?as=gost | bash \
  && curl -s https://i.jpillora.com/bhunter17/foundation-source!?as=mkclean | bash \
  && apt remove -y unzip \
  && update-ca-certificates \
  && apt clean
