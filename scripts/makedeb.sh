#!/bin/bash
#
# shellcheck source=vars.sh
#
# 
# Spustit z root adresare projektu pomoci ./scripts/makedeb.sh

set -e # Ihned opustit skript, pokud nastane chyba
source scripts/vars.sh # Import promennych

# Script
########
printf "Preparing environment\n"
mkdir -p "$work_path"

# Zkopiruje soubory a adresare s vyjimkou tech specifikovanych v zavorce
shopt -s extglob # zapne extended globbing?
cp -r !($work_dir|scripts|*.deb) "$work_path"

# Vytvori kopii before-script.sh a prepise v ni promenne, aby fungovaly na kazdem stroji.
# Mozna je lepsi to pro kazdy program hard codenout.
cp scripts/before-install-template.sh scripts/before-install.sh
sed -i "s|replace_path|$install_path|" scripts/before-install.sh # HACK

# smaze git slozku
find "$work_path" -depth -name '.git' -exec rm -rf '{}' \;

printf "Creating package\n"
fpm \
  -s dir -t deb -C "$work_dir" \
  -p "$name"_"$version"_"$iteration".deb \
  --name "$name" \
  --maintainer "$maintainer" \
  --version "$version" \
  --iteration "$iteration" \
  --description "$description" \
  --before-install scripts/before-install.sh \
  --after-install scripts/after-install.sh \
  -d "python3" \
  -d "python3-pip" \
  -d "python3-dev" \
  -d "libpq-dev" \
  -d "wget" \
  -d "redis" \
  -d "build-essential" \
  -d "zlib1g-dev" \
  -d "libncurses5-dev" \
  -d "libgdbm-dev" \
  -d "libnss3-dev" \
  -d "libssl-dev" \
  -d "libreadline-dev" \
  -d "libffi-dev" \
  -d "libsqlite3-dev" \
  -d "libbz2-dev" \
  opt

# cleanup
rm scripts/before-install.sh
rm -r $work_dir
