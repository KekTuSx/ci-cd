#!/bin/bash
#
# Prompt na odstraneni Python packagu pri odinstalaci balicku
set -e

while true; do
  read -rp "Uninstall Python dependencies? (y/n)" choice
  case "$choice" in 
    [yY]|[yY][eE][sS] )
          echo "Proceeding..."
          pip uninstall -y pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash
          break;;

    [nN]|[nN][oO] ) break;;

    * ) echo "Invalid input" >&2
  esac
done