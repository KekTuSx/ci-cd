#!/bin/bash

# shellcheck disable=SC2034

# jmeno balicku
name="anchoice-importer"
install_path="/opt/$name"
work_dir="dist"
work_path=$work_dir$install_path

version="1.0.0"
iteration=$(date +%s) # pocet sekund od pocatku IT veku