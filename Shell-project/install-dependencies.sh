#!/bin/bash

set -e

packages=(
    nginx
    unzip
    wget
    curl
    at
    msmtp
)

echo "Installing packages..."
sudo yum install -y "${packages[@]}"

echo "Installing fcgiwrap..."
sudo yum install -y fcgiwrap

echo "Enabling services..."
sudo systemctl enable --now nginx
sudo systemctl enable --now atd
sudo systemctl enable --now fcgiwrap@nginx.socket

echo "Setup completed successfully"