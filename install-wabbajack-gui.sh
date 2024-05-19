#!/usr/bin/env bash

# configuration - please adapt to your system
GUI_INSTALL_SCRIPT_DIR="$HOME/Downloads/Wabbajack-on-Linux" # location of this script
WABBAJACK_PREFIX="/data/Wabbajack"                          # path where Wabbajack will be installed to
MODLIST_DIR="/data/Modlists"                                # path where the actual modlists will be installed to
DOWNLOADED_MODLISTS_DIR="/data/downloaded_mod_lists"        # path where Wabbajack will save modlist.wabbajack files
STEAM_DIR="$HOME/.local/share/Steam"                        # steam directory to detect games from steam library

## don't modify the script below this line unless you know what you're doing

# wabbajack
GUI_DOWNLOAD_FILE="/tmp/Wabbajack.exe"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"

# get latest version number
WABBAJACK_VERSION=$(curl https://github.com/wabbajack-tools/wabbajack/releases/latest --verbose 2>&1 | grep ocation | sed 's:.*/::' | sed 's/.\{1\}$//')
if [[ "$WABBAJACK_VERSION" == "" ]]; then
    WABBAJACK_VERSION="3.5.0.1"
fi

# symlinks
DOWNLOADED_MODLISTS_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack/$WABBAJACK_VERSION/downloaded_mod_lists"
MODLIST_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
STEAM_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Program Files (x86)/Steam"

# download latest release
curl -o $GUI_DOWNLOAD_FILE https://github.com/wabbajack-tools/wabbajack/releases/latest/download/Wabbajack.exe

# prefix
mkdir -p "$WABBAJACK_PREFIX"
env WINEPREFIX="$WABBAJACK_PREFIX" wineboot -u
env WINEPREFIX="$WABBAJACK_PREFIX" winetricks win7
mkdir -p "$WABBAJACK_DIR/$WABBAJACK_VERSION"

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
echo "cd \"$WABBAJACK_DIR\"" >"$HOME/Desktop/run-wabbajack.sh"
echo "env WINEPREFIX=\""$WABBAJACK_PREFIX/"\" wine ./Wabbajack.exe" >>"$HOME/Desktop/run-wabbajack.sh"
chmod +x "$HOME/Desktop/run-wabbajack.sh"

# create reset script and make it executable
echo "#!/usr/bin/env bash" >"$HOME/Desktop/reset-and-run-wabbajack.sh"
echo "PREFIX=\"$WABBAJACK_PREFIX\"" >>"$HOME/Desktop/reset-and-run-wabbajack.sh"
echo "rm -rf \"\$PREFIX\"" >>"$HOME/Desktop/reset-and-run-wabbajack.sh"
echo "\"$GUI_INSTALL_SCRIPT_DIR/install-wabbajack-gui.sh\"" >>"$HOME/Desktop/reset-and-run-wabbajack.sh"
echo "cd \"\$PREFIX/drive_c/Wabbajack\"" >>"$HOME/Desktop/reset-and-run-wabbajack.sh"
echo "env WINEPREFIX=\"\$PREFIX\" wine ./Wabbajack.exe" >>"$HOME/Desktop/reset-and-run-wabbajack.sh"
chmod +x "$HOME/Desktop/reset-and-run-wabbajack.sh"

echo " Installation complete. Use the created run script at $HOME/Desktop/run-wabbajack.sh to launch Wabbajack."
echo " If the nexus mods login/download page stays blank, run $HOME/Desktop/reset-and-run-wabbajack.sh to discard the previous prefix."
echo " This will not affect your downloaded modlists since they are symlinked into the Wabbajack installation directory."
