#!/usr/bin/env bash

# configuration
WABBAJACK_ZIP="/$HOME/Downloads/wabbajack-cli.zip"
NEXUS_API_KEY="YOURAPIKEY"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
STEAM_DIR="/home/tehwolf/.local/share/Steam"
SYMLINK_DIR="/data/Wabbajack/drive_c/Program Files (x86)/Steam"

# prefix
mkdir -p $WABBAJACK_PREFIX
env WINEPREFIX=$WABBAJACK_PREFIX wineboot -u
mkdir -p $WABBAJACK_DIR
mkdir -p $MODLIST_DIR

# enable steam library detection
ln -s "$STEAM_DIR" "$SYMLINK_DIR"

# wabbajack
unzip $WABBAJACK_ZIP -d $WABBAJACK_DIR/wabbajack-set-nexus-api-key
cd $WABBAJACK_DIR
chmod +x $WABBAJACK_DIR/wabbajack-set-nexus-api-key/wabbajack-cli.exe

# run cli and set nexus api key to test functionality
env WINEPREFIX=$WABBAJACK_PREFIX wine $WABBAJACK_DIR/wabbajack-set-nexus-api-key/wabbajack-cli.exe set-nexus-api-key -k $NEXUS_API_KEY

# create run script
echo "env WINEPREFIX=\"$WABBAJACK_PREFIX\" wine \"$WABBAJACK_DIR/wabbajack-set-nexus-api-key/wabbajack-cli.exe\"" >"$WABBAJACKDIR/run-wabbajack.sh"
