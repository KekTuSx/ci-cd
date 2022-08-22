#!/bin/bash
#
# Sets system up for CI/CD

# Authorized SSH key
mkdir ~/.ssh
read -pr "Enter a public SSH key: " pub
echo "$pub" >> ~/.ssh/authorized_keys

# Sudoers
echo "$USER ALL=(ALL:ALL) NOPASSWD:/bin/apt" | sudo tee /etc/sudoers.d/"$USER"
