#!/bin/bash
#
# Nainstaluje Python package
set -e

printf "Running after install/upgrade script\n"

# SCRAPPED Instalace nejnovejsiho Pythonu a dalsich pozadavku
# python_ver="3.10.6"
# python_dl="https://www.python.org/ftp/python/$python_ver/Python-$python_ver.tgz"
# python_name="Python-$python_ver.tgz"

# wget $python_dl -O $python_name
# tar -xvf $python_name
# cd $python_name

# ./configure --enable-optimizations
# make -j
# make altinstall

# Prida /usr/local/bin do PATH, pokud tam neni
# tqdm, unidecode a jeste nejake skripty se tam instaluji
if ! echo "$PATH" | grep -q "/usr/local/bin"
  then PATH="/usr/local/bin:${PATH}"
fi

# Instalace Python packagu; bez progress baru
pip install pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash --progress-bar off
pip check

rm -f /tmp/package-*

printf "After install/upgrade script finished\n"
