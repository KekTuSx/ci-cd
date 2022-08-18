#!/bin/bash
#
# Requirements for creating packages with FPM

apt update
apt install ruby ruby-dev rubygems build-essential

gem install fpm
