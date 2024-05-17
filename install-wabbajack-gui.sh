#!/usr/bin/env bash

# configuration
GUI_DOWNLOAD_FILE="$HOME/Downloads/Wabbajack.exe"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="/data/Modlists"
MODLIST_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
DOWNLOADED_MODLISTS_DIR="/data/downloaded_mod_lists"
DOWNLOADED_MODLISTS_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack/3.5.0.1/downloaded_mod_lists"
STEAM_DIR="/home/tehwolf/.local/share/Steam"
STEAM_SYMLINK_DIR="/data/Wabbajack/drive_c/Program Files (x86)/Steam"

# prefix
mkdir -p "$WABBAJACK_PREFIX"
env WINEPREFIX="$WABBAJACK_PREFIX" wineboot -u
env WINEPREFIX="$WABBAJACK_PREFIX" winetricks win7
mkdir -p "$WABBAJACK_DIR/3.5.0.1"

# enable steam library detection
ln -s "$STEAM_DIR" "$STEAM_SYMLINK_DIR"

# symlink modlist folder
ln -s "$MODLIST_DIR" "$MODLIST_SYMLINK_DIR"

# symlink downloaded_mod_lists folder
ln -s "$DOWNLOADED_MODLISTS_DIR" "$DOWNLOADED_MODLISTS_SYMLINK_DIR"

# copy wabbajack and make it executable
cp "$GUI_DOWNLOAD_FILE" -d "$WABBAJACK_DIR/"
chmod +x "$WABBAJACK_DIR/Wabbajack.exe"

# create run script and make it executable
echo "env WINEPREFIX=\""$WABBAJACK_PREFIX/"\" wine \""$WABBAJACK_DIR"/Wabbajack.exe\"" >"$WABBAJACK_DIR/run-wabbajack.sh"
chmod +x "$WABBAJACK_DIR/run-wabbajack.sh"

echo "Installation complete. Use the created run script at "$WABBAJACK_DIR/run-wabbajack.sh" to launch Wabbajack"
