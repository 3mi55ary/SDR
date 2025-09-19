#!/bin/bash

sudo apt-get install -y libsoapysdr-dev soapysdr-module-rtlsdr

# Remove old SoapyRTL if needed
sudo rm -rf /usr/local/lib/SoapySDR/modules*/*rtlsdr*

# Rebuild SoapyRTL from source
git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig

# Install SoapySDR dev headers (needed for build)
sudo apt-get install -y libsoapysdr-dev

# Clone and build the correct plugin
cd ~/
git clone https://github.com/pothosware/SoapyRTLSDR.git
cd SoapyRTLSDR
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig

