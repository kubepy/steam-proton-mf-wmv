#!/bin/sh -x
set -e

[ -z "$WINEPREFIX" ] && echo "WINEPREFIX not set" && exit 1
[ -z "$PROTON" ] && echo "PROTON not set" && exit 1

export PATH="$PROTON/bin:$PATH"
export WINESERVER="$PROTON/bin/wineserver"
export WINELOADER="$PROTON/bin/wine"
export WINEDLLPATH="$PROTON/lib/wine:$PROTON/lib64/wine"
export WINEDEBUG="-all"

if [ ! -f "windows6.1-KB976932-X64.exe" ]; then
    wget "https://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X64.exe"
fi

if [ ! -f "Windows6.1-KB968211-x64-RefreshPkg.msu" ]; then
    wget "http://download.microsoft.com/download/B/9/B/B9BED058-8669-490E-BA61-D502E4E8BEB1/Windows6.1-KB968211-x64-RefreshPkg.msu"
fi

python3 installcab.py windows6.1-KB976932-X64.exe mediafoundation
python3 installcab.py windows6.1-KB976932-X64.exe mf_
python3 installcab.py windows6.1-KB976932-X64.exe mfreadwrite
python3 installcab.py windows6.1-KB976932-X64.exe wmadmod
python3 installcab.py windows6.1-KB976932-X64.exe wmvdecod
python3 installcab.py windows6.1-KB976932-X64.exe wmadmod

cabextract Windows6.1-KB968211-x64-RefreshPkg.msu
python3 installcab.py Windows6.1-KB968211-x64-RefreshPkg.cab mfplat

rm -f Windows6.1-KB968211-x64-RefreshPkg.cab \
      Windows6.1-KB968211-x64-RefreshPkg.xml \
      Windows6.1-968211-x64-pkgProperties.txt \
      WSUSSCAN.cab
