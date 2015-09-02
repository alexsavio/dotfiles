#!/bin/bash

hdiutil convert -format UDRW -o ~/path/to/target.img ~/path/to/ubuntu.iso

diskutil list

diskutil list

diskutil unmountDisk /dev/diskN

sudo dd if=/path/to/downloaded.img of=/dev/rdiskN bs=1m

diskutil eject /dev/diskN
