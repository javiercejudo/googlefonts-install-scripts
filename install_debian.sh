#!/bin/bash
# For Debian-based systems.

MY_ID_SUFFIX=j4v1eRc3juD0
FONTS_ENDPOINT=https://github.com/w0ng/googlefontdirectory/tarball/master

DOWNLOAD_LOCATION=~/Documents/
DOWNLOAD_EXTRACT_DIRNAME=google-fonts-$MY_ID_SUFFIX
DOWNLOAD_FILENAME=master-$MY_ID_SUFFIX.tar.gz

DESTINATION_DIR=/usr/local/share/fonts/$DOWNLOAD_EXTRACT_DIRNAME

echo "Installing all Google Web Fonts onto your Debian system"
echo "Downloading the fonts..."

cd $DOWNLOAD_LOCATION
curl -L $FONTS_ENDPOINT -o $DOWNLOAD_FILENAME
echo "Extracting the fonts..."
mkdir -p $DOWNLOAD_EXTRACT_DIRNAME
tar -zxf $DOWNLOAD_FILENAME -C $DOWNLOAD_EXTRACT_DIRNAME

cd $DOWNLOAD_EXTRACT_DIRNAME
find . -mindepth 2 -type f -print -exec mv {} . \;
rm -R -- */
rm *.txt
rm *.json

echo "Moving fonts..."
cd ..
sudo mkdir -p $DESTINATION_DIR
sudo mv $DOWNLOAD_EXTRACT_DIRNAME/* $DESTINATION_DIR

echo "Building font information caches..."
fc-cache -fv

echo "Fonts installed, cleaning up files..."
cd $DOWNLOAD_LOCATION
rm -f $DOWNLOAD_FILENAME
rm -rf $DOWNLOAD_EXTRACT_DIRNAME
echo "Done! All Google Fonts installed."
