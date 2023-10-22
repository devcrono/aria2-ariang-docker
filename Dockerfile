FROM debian:stable-slim

RUN apt update && apt install -y jq findutils

LABEL AUTHOR=Junv<wahyd4@gmail.com>

WORKDIR /app

ARG UPLOADER

ENV UPLOADER=$UPLOADER

ENV RPC_SECRET=""
ENV ENABLE_AUTH=false
ENV ENABLE_RCLONE=false
ENV DOMAIN=:80
ENV ARIA2_USER=user
ENV ARIA2_PWD=password
ENV ARIA2_SSL=false
ENV ARIA2_EXTERNAL_PORT=80
ENV PUID=1000
ENV PGID=1000
ENV CADDYPATH=/app
ENV RCLONE_CONFIG=/app/conf/rclone.conf
ENV XDG_DATA_HOME=/app/.caddy/data
ENV XDG_CONFIG_HOME=/app/.caddy/config
ENV XDG_CACHE_HOME=/app/.cache
ENV RCLONE_CONFIG_BASE64=""
ENV ENABLE_APP_CHECKER=true
ENV CADDY_LOG_LEVEL=INFO
ENV RCLONE_AUTO_UPLOAD_PROVIDER=
ENV RCLONE_AUTO_UPLOAD_REMOTE_PATH=/downloads
ENV RCLONE_AUTO_UPLOAD_FILE_MIN_SIZE=1K
ENV RCLONE_AUTO_UPLOAD_FILE_MAX_SIZE=50G
ENV FIX_DATA_VOLUME_PERMISSIONS=false

ADD install.sh aria2c.sh proxytunnel.sh caddy.sh Procfile init.sh start.sh uploader.sh /app/
ADD conf /app/conf
ADD Caddyfile SecureCaddyfile /usr/local/caddy/

RUN ./install.sh

RUN rm ./install.sh


RUN ./init.sh

EXPOSE 7860

USER junv

CMD ["./start.sh"]
