#!/usr/bin/env bash

# Configuration
CLI_DOWNLOAD_FILE="$HOME/Downloads/wabbajack-cli.zip"
NEXUS_API_KEY=""
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
WABBAJACK_VERSION="3.5.0.1" # todo: get current version?
MODLIST_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"

mkdir -p $WABBAJACK_PREFIX
env WINEPREFIX=$WABBAJACK_PREFIX wineboot -u
mkdir -p $WABBAJACK_DIR
mkdir -p $MODLIST_DIR
unzip $CLI_DOWNLOAD_FILE -d $WABBAJACK_DIR/$WABBAJACK_VERSION
cd $WABBAJACK_DIR
chmod +x $WABBAJACK_DIR/$WABBAJACK_VERSION/wabbajack-cli.exe
# todo: install dotnet8 and reactivate the step below
#env WINEPREFIX=$WABBAJACK_PREFIX wine $WABBAJACK_DIR/$WABBAJACK_VERSION/wabbajack-cli.exe setnexusapikey $NEXUS_API_KEY
