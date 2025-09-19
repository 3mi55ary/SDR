sudo apt install devscripts build-essential cmake libusb-1.0-0-dev
dget -q -u https://download.opensuse.org/repositories/home:/knegge:/branches:/home:/librespace:/satnogs-unstable/Debian_11/rtl-sdr_2.0.2-3satnogs1.dsc
cd rtl-sdr-2.0.2
dpkg-buildpackage -us -uc -b
cd ..
sudo dpkg -i rtl-sdr_2.0.2-3satnogs1_amd64.deb librtlsdr0_2.0.2-3satnogs1_amd64.deb
