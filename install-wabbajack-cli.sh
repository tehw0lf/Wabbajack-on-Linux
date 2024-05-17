#!/usr/bin/env bash

# configuration
WABBAJACK_ZIP="/$HOME/Downloads/wabbajack-cli.zip"
NEXUS_API_KEY="YOURAPIKEY"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="/data/Modlists"
MODLIST_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
DOWNLOADED_MODLISTS_DIR="/data/downloaded_mod_lists"
DOWNLOADED_MODLISTS_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack/wabbajack-set-nexus-api-key/downloaded_mod_lists"
STEAM_DIR="/home/tehwolf/.local/share/Steam"
STEAM_SYMLINK_DIR="/data/Wabbajack/drive_c/Program Files (x86)/Steam"

# prefix
mkdir -p "$WABBAJACK_PREFIX"
env WINEPREFIX="$WABBAJACK_PREFIX" wineboot -u
mkdir -p "$WABBAJACK_DIR/wabbajack-set-nexus-api-key"

# enable steam library detection
ln -s "$STEAM_DIR" "$STEAM_SYMLINK_DIR"

# symlink modlist folder
ln -s "$MODLIST_DIR" "$MODLIST_SYMLINK_DIR"

# symlink downloaded_mod_lists folder
ln -s "$DOWNLOADED_MODLISTS_DIR" "$DOWNLOADED_MODLISTS_SYMLINK_DIR"

# copy wabbajack and make it executable
unzip "$WABBAJACK_ZIP" -d "$WABBAJACK_DIR/wabbajack-set-nexus-api-key"
chmod +x "$WABBAJACK_DIR/wabbajack-set-nexus-api-key/wabbajack-cli.exe"

# run cli and set nexus api key to test functionality
cd "$WABBAJACK_DIR"
env WINEPREFIX="$WABBAJACK_PREFIX" wine "$WABBAJACK_DIR/wabbajack-set-nexus-api-key/wabbajack-cli.exe" set-nexus-api-key -k "$NEXUS_API_KEY"

echo "Installation complete. Use env WINEPREFIX=\""$WABBAJACK_PREFIX/"\" wine \""$WABBAJACK_DIR"/wabbajack-set-nexus-api-key/wabbajack-cli.exe\" to launch Wabbajack CLI"
