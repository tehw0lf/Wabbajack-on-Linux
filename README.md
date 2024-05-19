# Wabbajack on Linux

## Configuration

The configuration likely need to be adapted to your system.
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

The GUI installation script creates both a run script and a reset-and-run script on the user's Desktop. The reset-and-run script is intended to fix the blank page issue on nexus mods, see below.

## Troubleshooting - GUI

- after quitting and reopening Wabbajack the nexusmods download pages stay black and a right click inside the window causes both the page and Wabbajack to crash. Current fix: reinstall Wabbajack - the reset-and-run script does this automatically
- the nexusmods download pages are flickering while loading - Current fix: none yet

## Troubleshooting - CLI

- no issues reported yet
