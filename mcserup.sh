#!/bin/bash
echo this script must be run as root
#read -p "Enter github repo name for mods: " repo
#read -p "Enter github repo url for mods: " url
git clone https://github.com/tjdokas/serversetup-scripted
cd serversetup-scripted
java -jar forge2838-installer.jar --installServer
mv forge-1.12.2-14.23.5.2838-universal.jar server.jar
java -jar server.jar
rm eula.txt
echo "eula=true">>eula.txt
echo '#!/bin/bash'>>start.sh
echo 'screen -dm -S minecraft sudo java -Xmx16G -Xms2G -jar server.jar nogui'>>start.sh
chmod +x start.sh
mv LuckPerms-Sponge-5.1.17.jar mods
mv Nucleus-1.14.6-S7.1-MC1.12.2-plugin.jar mods
mv EssentialsX-2.17.2.1.jar mods
mv EssentialsXChat-2.17.2.1.jar mods
mv EssentialsXSpawn-2.17.2.1.jar mods
mv spongeforge-1.12.2-2838-7.2.3.jar mods
read -p "Enter github repo name for mods: " repo
read -p "Enter github repo url for mods: " url
git clone $url
cp $repo/* -r mods
echo run this command once the server has booted
echo /nucleus setupperms -g -y
