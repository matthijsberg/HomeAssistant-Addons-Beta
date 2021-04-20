#!/usr/bin/with-contenv bashio
mkdir /app
cd /app
if test ! -d RoonServer; then
        echo Downloading Roon Server Installer
        curl $ROON_SERVER_URL -O
        tar xjf $ROON_SERVER_PKG
        rm -f $ROON_SERVER_PKG
fi
echo Roonserver Installed, starting service.
/app/RoonServer/start.sh
