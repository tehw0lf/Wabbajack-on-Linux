# Wabbajack on Linux

## Configuration

The configuration likely need to be adapted to your system.
Default values:

### GUI

```sh
GUI_DOWNLOAD_FILE="$HOME/Downloads/Wabbajack.exe"
EDGE_DOWNLOAD_FILE="$HOME/Downloads/MicrosoftEdgeSetup.exe"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
STEAM_DIR="/home/tehwolf/.local/share/Steam"
SYMLINK_DIR="/data/Wabbajack/drive_c/Program Files (x86)/Steam"
```

### CLI

```sh
WABBAJACK_ZIP="/$HOME/Downloads/wabbajack-cli.zip"
NEXUS_API_KEY="YOURAPIKEY"
WABBAJACK_PREFIX="/data/Wabbajack"
WABBAJACK_DIR="$WABBAJACK_PREFIX/drive_c/Wabbajack"
MODLIST_DIR="$WABBAJACK_PREFIX/drive_c/Modlists"
STEAM_DIR="/home/tehwolf/.local/share/Steam"
SYMLINK_DIR="/data/Wabbajack/drive_c/Program Files (x86)/Steam"
```

## GUI Installation

`chmod +x ./install-wabbajack-gui.sh && ./install-wabbajack-gui.sh`

## CLI Installation (for automation purposes, requires nexusmods premium account)

`chmod +x ./install-wabbajack-cli.sh && ./install-wabbajack-cli.sh`

## Usage

Both installation scripts create a run script at `$WABBAJACK_DIR/run-wabbajack.sh` - feel free to copy this anywhere and double click / run through terminal to run.

## Troubleshooting - GUI

- the nexusmods download pages are flickering while loading
