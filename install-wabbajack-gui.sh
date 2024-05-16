#!/usr/bin/env bash

# Configuration
GUI_DOWNLOAD_FILE="$HOME/Downloads/Wabbajack.exe"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"

mkdir -p $WABBAJACK_PREFIX
env WINEPREFIX=$WABBAJACK_PREFIX wineboot -u
env WINEPREFIX=$WABBAJACK_PREFIX winetricks win7
mkdir -p $WABBAJACK_DIR
mkdir -p $MODLIST_DIR
cp $GUI_DOWNLOAD_FILE -d $WABBAJACK_DIR/
cd $WABBAJACK_DIR
chmod +x $WABBAJACK_DIR/Wabbajack.exe
env WINEPREFIX=$WABBAJACK_PREFIX wine $WABBAJACK_DIR/Wabbajack.exe
