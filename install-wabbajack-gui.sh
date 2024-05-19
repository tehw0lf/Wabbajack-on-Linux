#!/usr/bin/env bash

# get wabbajack version, on top because it's needed for some configuration parts - it greps for "ocation" to be case insensitive

WABBAJACK_VERSION=$(curl https://github.com/wabbajack-tools/wabbajack/releases/latest --verbose 2>&1 | grep ocation | sed 's:.*/::' | sed 's/.\{1\}$//')
if [[ "$WABBAJACK_VERSION" == "" ]]; then
    WABBAJACK_VERSION="3.5.0.1"
fi

# configuration
GUI_DOWNLOAD_FILE="$HOME/Downloads/Wabbajack.exe"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="/data/Modlists"
MODLIST_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
DOWNLOADED_MODLISTS_DIR="/data/downloaded_mod_lists"
DOWNLOADED_MODLISTS_SYMLINK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack/$WABBAJACK_VERSION/downloaded_mod_lists"
STEAM_DIR="/home/tehwolf/.local/share/Steam"
STEAM_SYMLINK_DIR="/data/Wabbajack/drive_c/Program Files (x86)/Steam"
GUI_INSTALL_SCRIPT_DIR="$HOME/Downloads/Wabbajack-on-Linux"

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
