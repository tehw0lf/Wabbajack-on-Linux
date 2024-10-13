# Wabbajack on Linux

## Configuration

The configuration likely needs to be adapted to your system.
Default values:

### GUI

```sh
GUI_INSTALL_SCRIPT_DIR="$HOME/Downloads/Wabbajack-on-Linux" # location of this script
WABBAJACK_PREFIX="/data/Wabbajack"                          # path where Wabbajack will be installed to
MODLIST_DIR="/data/Modlists"                                # path where the actual modlists will be installed to
DOWNLOADED_MODLISTS_DIR="/data/downloaded_mod_lists"        # path where Wabbajack will save modlist.wabbajack files
STEAM_DIR="$HOME/.local/share/Steam"                        # steam directory to detect games from steam library
```

### CLI

```sh
NEXUS_API_KEY="YOURAPIKEY"                           # your API key for nexusmods
WABBAJACK_ZIP="/$HOME/Downloads/wabbajack-cli.zip"   # the downloaded wabbajack installation archive
WABBAJACK_PREFIX="/data/Wabbajack"                   # path where Wabbajack will be installed to
DOWNLOADED_MODLISTS_DIR="/data/downloaded_mod_lists" # path where Wabbajack will save modlist.wabbajack files
MODLIST_DIR="/data/Modlists"                         # path where the actual modlists will be installed to
STEAM_DIR="$HOME/.local/share/Steam"                 # steam directory to detect games from steam library
```

## GUI Installation

`chmod +x ./install-wabbajack-gui.sh && ./install-wabbajack-gui.sh`

## CLI Installation (for automation purposes, requires nexusmods premium account)

`chmod +x ./install-wabbajack-cli.sh && ./install-wabbajack-cli.sh`

## Usage

The CLI can be run with `env WINEPREFIX=$WABBAJACK_PREFIX wine $WABBAJACK_DIR/wabbajack-set-nexus-api-key/wabbajack-cli.exe `

The GUI installation script creates both a run script and a reset-and-run script on the user's Desktop. The reset-and-run script is intended to fix the blank page issue on nexus mods, see below. The reset-and-run script runs the install script which preserves logins.

## Updating Wabbajack

Re-run the install script or run the reset-and-run script. The installation script can be used to update the Wabbajack installation as it runs the original install script which both downloads the latest version and preserves existing logins. All folders inside the release-specific directory are either disposable or symbolic links. Additionally it will preserve existing logins to nexusmods and vectorplexus. Those logins will be saves into /tmp/wjauth, which can be deleted after running the reset script - they are automatically removed after rebooting / shutting down the system.

## Known Issues

### GUI

- after quitting and reopening Wabbajack the nexusmods download pages do not render and a right click inside the window causes both the page and Wabbajack to crash. Current fix: reinstall Wabbajack - the reset-and-run script does this automatically
- the nexusmods download pages are flickering while loading - Current fix: none yet
- the nexusmods captcha is not loading - Current fix: wait / reinstall Wabbajack. This issue is rare but can occur

### CLI

- no issues reported yet
