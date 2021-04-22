#!/usr/bin/with-contenv bashio
cd /backup
if test ! -d roon; then
        echo "Back-up directory not found, creating in /backup/roon for roon native back-ups. Mapped to HA Back-up dir."
        mkdir /roon
fi
mkdir /app
cd /app
if test ! -d RoonServer; then
        echo "Downloading Roon Server Installer"
        curl $ROON_SERVER_URL -O
        tar xjf $ROON_SERVER_PKG
        rm -f $ROON_SERVER_PKG
fi
echo Roonserver Installed, starting service.
/app/RoonServer/start.sh
