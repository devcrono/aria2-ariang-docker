caddy: /app/caddy.sh
filebrowser: /app/filebrowser -p 8080 -d /app/filebrowser.db -r /data -b /files --username "$ARIA2_USER" --password "$(/app/filebrowser hash $ARIA2_PWD)"
aria2c: /app/aria2c.sh
proxy_tunnel: /app/proxytunnel.sh