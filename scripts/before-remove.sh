#!/bin/bash
#
# Script to run before uninstallation
set -e

printf "Running before removal script\n"

# For example: uninstall python packages before uninstalling package (which has Python and pip as a dependency)
# while true; do
#   read -rp "Uninstall Python dependencies? (y/n)" choice
#   case "$choice" in 
#     [yY]|[yY][eE][sS] )
#           echo "Proceeding..."
#           pip uninstall -y pika requests orjson zeep pyyaml xmltodict tqdm python-dateutil xlrd unidecode psycopg2 Pillow ImageHash
#           break;;

#     [nN]|[nN][oO] ) break;;

#     * ) echo "Invalid input" >&2
#   esac
# done

printf "Before removal script finished\n"
