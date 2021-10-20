#!/usr/bin/with-contenv bashio
cd /backup
if test ! -d roon; then
        echo "Back-up directory not found, creating in /backup/roon for roon native back-ups. Mapped to HA Back-up dir."
        mkdir roon
fi
mkdir /app
cd /app
if test ! -d RoonServer; then
        echo "Downloading Roon Server Installer"
        curl $ROON_SERVER_URL -O
        tar xjf $ROON_SERVER_PKG
        rm -f $ROON_SERVER_PKG
fi
echo "Roonserver Installed"
sleep 4h
cd /data/RoonServer/Database/Registry/Core
if test ! -f backups; then
        echo "Back-up schedule not found, downloading default for this HA install"
        wget https://github.com/matthijsberg/HomeAssistant-Addons/blob/main/RoonServer/config/backups
else
        echo "Existing Backup schedule config found, not toutching. DO CHECK FILE PATH! Should point to /backup. That folder is mapped to HA backup folder."
fi
if test ! -f backups_status; then
        echo "Default back-up path not set, downloading default for this HA install"
        wget https://github.com/matthijsberg/HomeAssistant-Addons/blob/main/RoonServer/config/backups_status
else
        echo "Default back-up path config file found, not toutching. DO CHECK FILE PATH! Should point to /backup. That folder is mapped to HA backup folder."
fi
echo "Installation an basic configuration finished! Starting service."
cd /app/RoonServer/
pause
/app/RoonServer/start.sh
