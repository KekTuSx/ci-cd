#!/bin/bash
#
#

set -e

# Vars
###########
export NAME="garges"
export INSTALL_PATH="usr/share"
work_dir="dist"
path=$work_dir/$INSTALL_PATH/$NAME

version="1.0.0"
iteration=$(date +%s) # pocet sekund od pocatku IT veku

# Script
########

printf "Preparing environment\n"
mkdir -p $path

# Zkopiruje soubory s vyjimkou tech specifikovanych v zavorce
shopt -s extglob # zapne extended globbing?
cp -r !($work_dir|makedeb.sh|prep.sh) $path

# smaze git slozku
find $path -depth -name '.git' -exec rm -rf '{}' \;

printf "Creating package\n\n"
fpm \
    -s dir -t deb -C "$work_dir" \
    -p "$NAME-$version-$iteration.deb" \
    --name "$NAME" \
    --maintainer "LD" \
    --version "$version" \
    --iteration "$iteration" \
    --description "Test" \
    --before-install scripts/before-install.sh \
    --after-install scripts/after-install.sh \
    usr

rm -r $work_dir
