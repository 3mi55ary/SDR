#!/bin/bash
# Used to allow the SatNOGS Client Docker container to access the RTL-SDR v4.

echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838", MODE:="0666"' \
| sudo tee /etc/udev/rules.d/99-rtlsdr.rules

sudo udevadm control --reload-rules
sudo udevadm trigger
