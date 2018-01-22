#!/bin/bash

set -uexo pipefail

# Custom kernel parameters
install --owner root --group root --mode 0644 ../files/vfio/default_grub_config /etc/default/grub

# List of devices (as vfio module options) that will be stubbed with vfio drivers
# Thes are the devices that we want to passtrough
install --owner root --group root --mode 0644 ../files/vfio/modprobe_options /etc/modprobe.d/vfio.conf

# Modules that has to be loaded at boot time
install --owner root --group root --mode 0644 ../files/vfio/modules_to_be_loaded /etc/modules

# Don't load nouveau and lbm-nouveau kernel modules at boot time
# This setting will allow the VFIO drivers to load for the devices that we want to passtrough
install --owner root --group root --mode 0644 ../files/vfio/modules_not_to_be_loaded /etc/modprobe.d/blacklist.conf

update-initramfs -u
update-grub
