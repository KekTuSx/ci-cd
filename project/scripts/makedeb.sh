#!/bin/bash
#
# shellcheck source=vars.sh
#
# 
# Run from root project folder with ./scripts/makedeb.sh

set -e # exits the script immeadeately if an error occurs

# Variables
################################
# TODO better solution for multiple install paths, maybe a loop and an array?
name="program"
install_path="/opt/$name"
#install_path2="/usr/local/bin/$name"
work_dir="dist"
work_path=$work_dir$install_path
#work_path2=$work_dir@install_path2

version="1.0.0"
iteration=$(date +%s) # number of seconds since the dawn of IT time
maintainer="LD"
description="blazingly fast program"

# Script
###############################
printf "Preparing environment\n"
mkdir -p "$work_path"
#mkdir -p "$work_path2"

# Copies files/directories except the ones specifiend in parenthesis to work dir
shopt -s extglob # zapne extended globbing?
cp -r !($work_dir|scripts|*.deb) "$work_path"
# cp -r bin "$work_path2"

# Creates a copy of template before install script and replaces i
cp scripts/before-install-template.sh scripts/before-install.sh
sed -i "s|replace_path|$install_path|" scripts/before-install.sh # HACK

# Delets .git folder
find "$work_path" -depth -name '.git' -exec rm -rf '{}' \;

printf "Creating package\n"
fpm \
  -s dir -t deb -C "$work_dir" \
  -p "$name"_"$version"_"$iteration".deb \
  --name "$name" \
  --maintainer "$maintainer" \
  --version "$version" \
  --iteration "$iteration" \
  --description "$description" \
  --before-install scripts/before-install.sh \
  --after-install scripts/after-install.sh \
  --before-remove scripts/before-remove.sh \
  -d "wget" \
  opt #usr

# cleanup
rm scripts/before-install.sh
rm -r $work_dir
