#!/bin/bash
#===============================================================================
# SCRIPT NAME   : BuildSatNOGS.sh
# DESCRIPTION   : Builds a customized SatNOGS station baseline
# AUTHOR        : 3mi55ary
# DATE          : 2025-09-20
# VERSION       : 1.0
# USAGE         : sudo ./BuildSatNOGS.sh
# NOTES         : UNTESTED on Latest Release of Raspberry Pi OS Lite (as of 2025-09-20)
#===============================================================================

#===============================================================================
# Remote Management Tools (Assuming SSH is already installed) ==================
#===============================================================================
# TMux = Multiple panes in one SSH session
sudo apt install tmux 
# btop = resource management
sudo apt install btop
# duf = disk management
sudo apt install duf

#===============================================================================
# Tooling ======================================================================
#===============================================================================
# Inspectrum
sudo apt install inspectrum

# strf
sudo apt install git make gcc pgplot5 gfortran libpng-dev libx11-dev libgsl-dev libfftw3-dev libsox-dev dos2unix pgplot5-dev
git clone https://github.com/cbassa/strf.git
cd strf; make
sudo make install
sudo apt install libcmocka-dev libcmocka0
make tests

#===============================================================================
# Station Drivers (Only for testing.  Not used by SatNOGS Client) ==============
#===============================================================================
# Install RTL-SDRv4 drivers (According to RTL-SDR Blog's website)
sudo apt purge ^librtlsdr
sudo rm -rvf /usr/lib/librtlsdr* /usr/include/rtl-sdr* /usr/local/lib/librtlsdr* /usr/local/include/rtl-sdr* /usr/local/include/rtl_* /usr/local/bin/rtl_*
sudo apt-get install -y libusb-1.0-0-dev git cmake pkg-config
git clone https://github.com/osmocom/rtl-sdr
cd rtl-sdr
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo cp ../rtl-sdr.rules /etc/udev/rules.d/
sudo ldconfig
echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

# Allows RTL-SDRv4 to be read by the SatNOGS Client Container 
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838", MODE:="0666"' \
| sudo tee /etc/udev/rules.d/99-rtlsdr.rules

sudo udevadm control --reload-rules
sudo udevadm trigger

#===============================================================================
# Set up SatNOGS Client ========================================================
#===============================================================================
# Install SatNOGS Docker and configure when prompted
curl -sfL https://satno.gs/install | sh -s --
