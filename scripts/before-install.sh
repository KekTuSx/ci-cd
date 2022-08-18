#!/bin/bash
set -e

printf "Before installation\n"
mkdir -p /"$INSTALL_PATH"/"$NAME" && cd /"$INSTALL_PATH"/"$NAME"

rm -rf temp/ log/
