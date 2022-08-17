#!/bin/bash
#
#

set -e

# Variables
###########
export NAME="garges"
install_folder="dist"
install_path="usr/share"
version="1.0.0"
iteration=$(date +%s) # pocet sekund od pocatku IT veku

# Script
########
mkdir -p $install_folder/$install_path/$NAME

# 
shopt -s extglob # zapne extended globbing?
cp -r !($install_folder|makedeb.sh|prep.sh) $NAME

fpm \
    -s dir -t deb -C "$NAME" \
    -p "$NAME-$version-$iteration" \
    --name "$NAME" \
    --maintainer "LD" \
    --version "$version" \
    --iteration "$iteration" \
    --description "Test" \
    --before-install scripts/before-install.sh \
    --after-install scripts/after-install.sh \
    -d bash \
    usr

rm -r $install_folder
