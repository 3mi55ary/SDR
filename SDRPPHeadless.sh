#!/bin/bash

# Update package index
sudo apt update

# Download the latest SDR++ .deb release
wget -O sdrpp_latest.deb https://github.com/AlexandreRouma/SDRPlusPlus/releases/latest/download/sdrpp_debian_bookworm_amd64.deb

# Install the .deb package and let APT resolve dependencies
sudo apt install -y ./sdrpp_latest.deb

# Optional: Reload udev rules if SDR hardware was just plugged in
sudo udevadm control --reload-rules
sudo udevadm trigger

# Launch SDR++ in server mode (adjust firewall rules if needed)
sdrpp --server --server-bind 0.0.0.0 --server-port 5259
