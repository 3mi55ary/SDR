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

# Remove any broken or partial install
sudo rm -rf ~/SoapyRTLSDR

# Re-clone and rebuild
git clone https://github.com/pothosware/SoapyRTLSDR.git
cd SoapyRTLSDR
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install
sudo ldconfig

# Link driver support to .8 path
sudo mkdir -p /usr/local/lib/SoapySDR/modules0.8
sudo ln -s /usr/local/lib/SoapySDR/modules0.8-3/librtlsdrSupport.so /usr/local/lib/SoapySDR/modules0.8/librtlsdrSupport.so
