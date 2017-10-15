#!/bin/bash

# Pre-Installation

# Connect to the Internet
# wifi-menu

# Update the system clock
timedatectl set-ntp true

# Partition the disks
parted /dev/sda mklabel msdos
echo "mkpart primary ext4 0 100%
set 1 boot on
quit
" | parted /dev/sda

# Format the partitions
mkfs.ext4 /dev/sda1

# Mount the partitions
mount /dev/sda1 /mnt

# Select the mirrors
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
grep -E -A 1 ".*Germany.*$" /etc/pacman.d/mirrorlist.bak | sed '/--/d' > /etc/pacman.d/mirrorlist

# Install the base packages
pacstrap -i /mnt base base-devel

# Configure the system
genfstab -U /mnt > /mnt/etc/fstab

# Copy the setup folder to the new system
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -R $DIR /mnt/

# Change root into the new system and start second Script
echo "Execute Installation.sh"
arch-chroot /mnt /bin/bash
