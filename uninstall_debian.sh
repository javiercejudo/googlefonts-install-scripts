#!/bin/bash
# For Debian-based systems.

MY_ID_SUFFIX=j4v1eRc3juD0
DOWNLOAD_EXTRACT_DIRNAME=google-fonts-$MY_ID_SUFFIX

FONTS_DIR=/usr/local/share/fonts/

echo "Uninstalling all Google Web Fonts from your Debian system"

cd $FONTS_DIR
sudo rm -rf ./$DOWNLOAD_EXTRACT_DIRNAME

echo "Building font information caches..."
fc-cache -fv

echo "Done! All Google Fonts uninstalled."