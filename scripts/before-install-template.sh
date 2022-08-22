#!/bin/bash
#
# Prida /usr/local/bin do PATH, vytvori instalacni adresare
set -e

# Prida /usr/local/bin do PATH, pokud tam neni
# tqdm, unidecode a jeste nejake skripty se tam instaluji a hodi warning, kdyz to neni v PATH
if ! echo "$PATH" | grep -q "/usr/local/bin"
  then PATH="/usr/local/bin:${PATH}"
fi

installation_path="replace_path"

printf "Running before install script\n"
mkdir -p "$installation_path" && cd "$installation_path" # Jenom na cleanup? Jestli jo, tak jsem nad tim, aby to fungovalu vsude, stravil az moc casu.
echo "Instalacni cesta je: $installation_path" # debug

rm -rf temp/ log/

printf "Before install script finished\n"
