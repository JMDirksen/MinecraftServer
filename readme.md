# Minecraft Server

    sudo apt install -y git jq cron screen openjdk-19-jre-headless zip unzip
    git clone https://github.com/JMDirksen/MinecraftServer.git minecraftserver
    cp config.conf.template config.conf
    nano config.conf

# Java

    cd ~/minecraftserver/java
    cp server.properties.template server/server.properties
    ./update.sh

# Bedrock

    cd ~/minecraftserver/bedrock
    cp server.properties.template server/server.properties
    ./update.sh

## In game

    /gamemode creative
    /tp 0 100 0
    /setworldspawn
    /gamerule spawnradius 100
    /gamerule showcoordinates true

# Backup

    ssh-keygen
    cat ~/.ssh/id_rsa.pub

Add the public key to the authorized_keys file on the backuphost
Accept fingerprint and test connection:

    ssh username@backuphost

# Automation

    cd ~/minecraftserver
    crontab crontab.template
