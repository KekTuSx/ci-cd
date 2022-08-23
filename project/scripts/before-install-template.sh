#!/bin/bash
#
# Script to run before installation
set -e

printf "Running before install script\n"

installation_path="replace_path"

mkdir -p "$installation_path" && cd "$installation_path" 

rm -rf temp/ log/

printf "Before install script finished\n"
