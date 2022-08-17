#!/bin/bash
set -e

printf "Preparing for packaging"
mkdir -p /usr/share/"$NAME" && cd /usr/share/"$NAME"

rm -rf temp/ log/
