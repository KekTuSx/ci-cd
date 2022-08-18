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

pip install pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash

rm -f /tmp/package-*

printf "Bbefore install script finished\n"
