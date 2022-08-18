#!/bin/bash
set -e

printf "Running after install script\n"

# Instalace Pythonu a dalsich pozadavku

# python_ver="3.10.6"
# python_dl="https://www.python.org/ftp/python/$python_ver/Python-$python_ver.tgz"
# python_name="Python-$python_ver.tgz"

# wget $python_dl -O $python_name
# tar -xvf $python_name
# cd $python_name

# ./configure --enable-optimizations
# make -j
# make altinstall

# Instalace Python packagu; bez progress baru
pip install pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash --progress-bar off

# Prida /usr/local/bin do PATH, pokud tam neni
# tqdm, unidecode a jeste nejake skripty se tam instaluji a hodi warning, kdyz to neni v PATH
[[ ":$PATH:" != *":/usr/local/bin:"* ]] && PATH="/usr/local/bin:${PATH}"

rm -f /tmp/package-*

printf "After install script finished\n"
