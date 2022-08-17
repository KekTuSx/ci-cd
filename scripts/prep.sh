#!/bin/bash
#
# Instaluje FPM

apt update
apt install ruby ruby-dev rubygems build-essential

gem install fpm
