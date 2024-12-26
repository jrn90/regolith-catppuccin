#!/usr/bin/env bash 
# 
# Installs theme

set -o errexit
set -o nounset
set -o pipefail

FOLDER_PATH=/usr/share/regolith-look/catppuccin

if [ -d "$FOLDER_PATH" ]; then
  read -p "Folder already exists. Overwrite? (y/N): " -n 1 -r
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    printf "\n"
    echo "Exiting. No changes."
    exit 0
  fi
  printf "\n"
fi

echo "Installing theme..."

# create folder path 
sudo mkdir -p "${FOLDER_PATH}"

# copy theme
sudo cp -r ./theme/. "${FOLDER_PATH}"
sudo cp -r ./walls/ "${FOLDER_PATH}"

echo "DONE!"
