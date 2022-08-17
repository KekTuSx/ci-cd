#!/bin/bash
set -e

printf "Before installation\n"
mkdir -p /"$INSTALL_PATH"/"$NAME" && cd /usr/share/"$NAME"

rm -rf temp/ log/
