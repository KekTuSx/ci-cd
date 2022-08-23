#!/bin/bash
#
# Script to run after install
set -e

printf "Running after install/upgrade script\n"

if ! echo "$PATH" | grep -q "/usr/local/bin"
  then PATH="/usr/local/bin:${PATH}"
fi

pip install pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash --progress-bar off
pip check

rm -f /tmp/package-*

printf "After install/upgrade script finished\n"
