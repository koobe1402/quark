#!/bin/bash

set -uexo pipefail

# OVMF is an open-source UEFI firmware for QEMU virtual machines
install --owner root --group root --mode 0600 ../files/win10_kvm/win10_VARS.fd /data/win10/nvram/win10_VARS.fd

# Install 1080TI FE BIOS
install --owner root --group root --mode 0600 ../files/win10_kvm/vga.rom /data/win10/rom/vga.rom

# Configure qemu
install --owner root --group root --mode 0600 ../files/win10_kvm/qemu.conf /etc/libvirt/qemu.conf

# This is not working!!!
cat >> /etc/apparmor.d/abstractions/libvirt-qemu <<EOF
  /var/lib/libvirt/images/** r,
  /data/win10/** r,
  /run/udev/data/** r,
  /dev/bus/usb/*/[0-9]* rw,
EOF

# Define win10 VM
virsh define ../files/win10_kvm/win10_kvm.xml
