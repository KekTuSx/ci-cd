#!/bin/bash
set -e

installation_path="replace_path"

printf "Running before install script\n"
mkdir -p "$installation_path" && cd "$installation_path" # Jenom na cleanup? Jestli jo, tak jsem nad tim, aby to fungovalu vsude, stravil az moc casu.
echo "Instalacni cesta je: $installation_path" # debug

rm -rf temp/ log/

printf "Before install script finished\n"
