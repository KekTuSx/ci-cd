#!/bin/bash
#
# Prompt na odinstalovani python packagu
set -e

read -rp "Chcete odinstalovat i Python dependencies? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

pip uninstall pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash --progress-bar off
