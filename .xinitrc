#!/bin/bash
export BROWSER=firefox-nightly
sleep 1
nitrogen --restore &
exec awesome
sleep 3
sudo ip link set eth0 up
sudo systemctl start dhcpcd@eth0
sudo systemctl enable dhcpcd@eth0
