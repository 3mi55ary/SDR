#!/bin/bash

# Install SDR++ for server mode
sudo apt update
sudo apt install git cmake build-essential libfftw3-dev libusb-1.0-0-dev libglfw3-dev
git clone https://github.com/AlexandreRouma/SDRPlusPlus.git
cd SDRPlusPlus
mkdir build && cd build
cmake -DINSTALL_UDEV_RULES=ON -DOPT_BUILD_SERVER=ON ..
make -j$(nproc)
sudo make install

# Start the server | Change firewall rules based on your preferred firewall
sdrpp --server --server-bind 0.0.0.0 --server-port 5259
