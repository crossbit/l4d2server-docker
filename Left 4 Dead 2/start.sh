#!/bin/sh

if [ ! -d /srv/$GAME/serverfiles ]
then
    exit;
fi

if [ ! -f .speranza ]
then
    # Move out addons folder
    mv /srv/$GAME/serverfiles/left4dead2/addons /srv/$GAME
    ln -s /srv/$GAME/serverfiles/left4dead2/addons /srv/$GAME/addons
    # Install MM
    wget http://mirror.pointysoftware.net/alliedmodders/mmsource-1.10.6-linux.tar.gz
    tar -zxvf mmsource-1.10.6-linux.tar.gz -C /srv/$GAME/serverfiles/left4dead2
    rm mmsource-1.10.6-linux.tar.gz
    # Install SM
    wget https://sm.alliedmods.net/smdrop/1.8/sourcemod-1.8.0-git5973-linux.tar.gz
    tar -zxvf sourcemod-1.8.0-git5973-linux.tar.gz -C /srv/$GAME/serverfiles/left4dead2
    rm sourcemod-1.8.0-git5973-linux.tar.gz
    # Lock install
    touch .speranza
fi

/srv/$GAME/serverfiles/srcds_run -ip $BIND_IP -port $BIND_PORT -strictportbind "$@"