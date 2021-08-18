# Windows Media Foundation installer for Proton
Installer for Windows Media Foundation and Windows Media DLLs/codecs for Proton.

This will make sure that Windows games requiring this will be able to find their necessary components to start and play videos. The Windows Media Foundation core set and all DLLS and codecs required to open Windows Media Videos are installed inside the Wine prefix of your Windows game.

## Known working games with cut scenes:

- Spyro Reignited Trilogy
- Mortal Kombat 11
- Injustice 2
- Power Rangers: Battle for the Grid
- Darksiders: Warmastered Edition
- Borderlands 3
- Resident Evil 2 Remastered
- Resident Evil 3 Remastered
- Resident Evil 7
- PC Building Simulator
- Dangonronpa V3
- Super Lucky's Tale
- Remnant: From the Ashes
- BlazBlue Centralfiction
- Bloodstained: Ritual of the Night
- Crazy Machines 3
- Devil May Cry 5
- Wasteland 3

Just set these two variables and run the script:

- `WINEPREFIX` should point to the Wine installation used by the game (`compatdata`).
- `PROTON` should point to the `files` folder of a Proton installation that you have installed.

For example, to install the components in Darksiders Warmastered Edition using Proton - Experimental:

```
WINEPREFIX="$HOME/.steam/root/steamapps/compatdata/462780/pfx" \
  PROTON="$HOME/.steam/root/steamapps/common/Proton - Experimental/files" \
  ./install-mf-wmv.sh
```

The script will download all necessary files and leave them in the folder where the script is.

`installcab.py` is exactly the same as upstream (https://github.com/tonix64/python-installcab/blob/master/installcab.py)

## Dependencies
- python3
- cabextract
