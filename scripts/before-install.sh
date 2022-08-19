#!/bin/bash
set -e
source vars.sh

# python_ver="3.10.6"
# python_dl="https://www.python.org/ftp/python/$python_ver/Python-$python_ver.tgz"
# python_name="Python-$python_ver.tgz"

printf "Running before install script\n"
mkdir -p "$installl_path"/"$name" && cd "$installl_path"/"$name"

rm -rf temp/ log/

printf "Before install script finished\n"
