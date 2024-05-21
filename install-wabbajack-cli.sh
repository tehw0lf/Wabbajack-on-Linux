#!/usr/bin/env bash

# configuration - please adapt to your system
NEXUS_API_KEY="YOURAPIKEY"                           # your API key for nexusmods
WABBAJACK_ZIP="/$HOME/Downloads/wabbajack-cli.zip"   # the downloaded wabbajack installation archive
WABBAJACK_PREFIX="/data/Wabbajack"                   # path where Wabbajack will be installed to
DOWNLOADED_MODLISTS_DIR="/data/downloaded_mod_lists" # path where Wabbajack will save modlist.wabbajack files
MODLIST_DIR="/data/Modlists"                         # path where the actual modlists will be installed to
STEAM_DIR="$HOME/.local/share/Steam"                 # steam directory to detect games from steam library

## don't modify the script below this line unless you know what you're doing

# wabbbajack
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
WABBAJACK_AUTH_DATA="$WABBAJACK_PREFIX/drive_c/users/$USER/AppData/Local/Wabbajack/encrypted"
WABBAJACK_AUTH_DATA_BACKUP="/tmp/wjauth"

# backup current logins if available
mkdir -p "$WABBAJACK_AUTH_DATA_BACKUP"
cp "$WABBAJACK_AUTH_DATA/"* "$WABBAJACK_AUTH_DATA_BACKUP" 2>/dev/null

# symlinks
DOWNLOADED_MODLISTS_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack/wabbajack-cli/downloaded_mod_lists"
MODLIST_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
STEAM_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Program Files (x86)/Steam"

# prefix
rm -rf "$WABBAJACK_PREFIX"
mkdir -p "$WABBAJACK_PREFIX"
env WINEPREFIX="$WABBAJACK_PREFIX" wineboot -u
mkdir -p "$WABBAJACK_DIR/wabbajack-cli"

# restore current logins if available
mkdir -p "$WABBAJACK_AUTH_DATA"
cp "$WABBAJACK_AUTH_DATA_BACKUP/"* "$WABBAJACK_AUTH_DATA" 2>/dev/null

# enable steam library detection
ln -s "$STEAM_DIR" "$STEAM_SYMLINK_DIR"

# symlink modlist folder
ln -s "$MODLIST_DIR" "$MODLIST_SYMLINK_DIR"

# symlink downloaded_mod_lists folder
ln -s "$DOWNLOADED_MODLISTS_DIR" "$DOWNLOADED_MODLISTS_SYMLINK_DIR"

# copy wabbajack and make it executable
unzip "$WABBAJACK_ZIP" -d "$WABBAJACK_DIR/wabbajack-cli"
chmod +x "$WABBAJACK_DIR/wabbajack-cli/wabbajack-cli.exe"

# run cli and set nexus api key to test functionality
cd "$WABBAJACK_DIR"
env WINEPREFIX="$WABBAJACK_PREFIX" wine "$WABBAJACK_DIR/wabbajack-cli/wabbajack-cli.exe" set-nexus-api-key -k "$NEXUS_API_KEY"

echo "Installation complete. Use env WINEPREFIX=\""$WABBAJACK_PREFIX/"\" wine \""$WABBAJACK_DIR"/wabbajack-cli/wabbajack-cli.exe\" to launch Wabbajack CLI"
