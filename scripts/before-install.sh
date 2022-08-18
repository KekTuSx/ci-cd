#!/bin/bash
set -e

# python_ver="3.10.6"
# python_dl="https://www.python.org/ftp/python/$python_ver/Python-$python_ver.tgz"
# python_name="Python-$python_ver.tgz"

printf "Running before install script\n"
mkdir -p /"$INSTALL_PATH"/"$NAME" && cd /"$INSTALL_PATH"/"$NAME"

# Instalace Pythonu a dalsich pozadavku
# wget $python_dl -O $python_name
# tar -xvf $python_name
# cd $python_name

# ./configure --enable-optimizations
# make -j
# make altinstall

pip install pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash

rm -rf temp/ log/

printf "Before install script finished\n"
