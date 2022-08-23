#!/bin/bash
#
# Sets system up for CI/CD

# Authorized SSH key
mkdir ~/.ssh
read -pr "Enter a public SSH key: " pub
echo "$pub" >> ~/.ssh/authorized_keys

# Sudoers - allows current user to invoke sudo apt commands without a password
echo "$USER ALL=(ALL:ALL) NOPASSWD:/bin/apt" | sudo tee /etc/sudoers.d/"$USER"
