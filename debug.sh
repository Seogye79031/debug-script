rm -rf server
mkdir server
echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#Mon Mar 20 21:15:37 PDT 2017
eula=true" > "server/eula.txt"
read -p "enter minecraft version: " VERSION
curl -X GET "https://papermc.io/api/v2/projects/paper/versions/$VERSION" -H  "accept: application/json"
read -p "\nselect build version: " LATEST_BUILD
read -p "select build folder (./build/):" BUILD_FILE
wget -O "server/paper.jar" "https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$LATEST_BUILD/downloads/paper-$VERSION-$LATEST_BUILD.jar"
wget -O "server/start.sh" "https://raw.githubusercontent.com/seogye79031/debug-script/main/start.sh"
mkdir server/plugins
mv "$BUILD_FILE" "server/plugins/"
echo "ram: 4G"
echo "version: $VERSION"
echo "build: $LATEST_BUILD"
echo "starting server.."
cd server
./start.sh