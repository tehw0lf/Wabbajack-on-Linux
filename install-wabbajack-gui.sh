#!/usr/bin/env bash

# configuration
GUI_DOWNLOAD_FILE="$HOME/Downloads/Wabbajack.exe"
EDGE_DOWNLOAD_FILE="$HOME/Downloads/MicrosoftEdgeSetup.exe"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
STEAM_DIR="/home/tehwolf/.local/share/Steam"
SYMLINK_DIR="/data/Wabbajack/drive_c/Program Files (x86)/Steam"

# prefix
mkdir -p $WABBAJACK_PREFIX
env WINEPREFIX=$WABBAJACK_PREFIX wineboot -u
env WINEPREFIX=$WABBAJACK_PREFIX winetricks win7
mkdir -p $WABBAJACK_DIR
mkdir -p $MODLIST_DIR

# enable steam library detection
ln -s "$STEAM_DIR" "$SYMLINK_DIR"
cp $GUI_DOWNLOAD_FILE -d $WABBAJACK_DIR/
chmod +x $WABBAJACK_DIR/Wabbajack.exe

# create run script
echo "env WINEPREFIX=\"$WABBAJACK_PREFIX\" wine \"$WABBAJACK_DIR/Wabbajack.exe\"" >"$WABBAJACK_DIR/run-wabbajack.sh"
chmod +x "$WABBAJACK_DIR/run-wabbajack.sh"

# Edge for WebView
cd $WABBAJACK_PREFIX/drive_c
env WINEPREFIX=$WABBAJACK_PREFIX wine $EDGE_DOWNLOAD_FILE
