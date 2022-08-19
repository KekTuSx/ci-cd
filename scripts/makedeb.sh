#!/bin/bash
#
#
# Run from root folder wtih ./scripts/makedeb.sh

set -e
source vars.sh

# Script
########

printf "Preparing environment\n"
mkdir -p "$path"

# Zkopiruje soubory s vyjimkou tech specifikovanych v zavorce
shopt -s extglob # zapne extended globbing?
cp -r !($work_dir|makedeb.sh|prep.sh) "$path"

# smaze git slozku
find "$path" -depth -name '.git' -exec rm -rf '{}' \;

printf "Creating package\n"
fpm \
    -s dir -t deb -C "$work_dir" \
    -p "$name"_"$version"_"$iteration".deb \
    --name "$name" \
    --maintainer "LD" \
    --version "$version" \
    --iteration "$iteration" \
    --description "Anchoice importer" \
    --before-install scripts/before-install.sh \
    --after-install scripts/after-install.sh \
    -d "python3" \
    -d "python3-pip" \
    -d "python3-dev" \
    -d "libpq-dev" \
    -d "wget" \
    -d "redis" \
    -d "build-essential" \
    -d "zlib1g-dev" \
    -d "libncurses5-dev" \
    -d "libgdbm-dev" \
    -d "libnss3-dev" \
    -d "libssl-dev" \
    -d "libreadline-dev" \
    -d "libffi-dev" \
    -d "libsqlite3-dev" \
    -d "libbz2-dev" \
    opt

# cleanup
rm -r $work_dir
