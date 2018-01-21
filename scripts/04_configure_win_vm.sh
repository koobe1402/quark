#!/bin/bash

set -uexo pipefail

install --owner root --group root --mode 0600 ../files/win10_kvm/win10_VARS.fd /data/win10/nvram/win10_VARS.fd

install --owner root --group root --mode 0600 ../files/win10_kvm/vga.rom /data/win10/rom/vga.rom

install --owner root --group root --mode 0600 ../files/win10_kvm/qemu.conf /etc/libvirt/qemu.conf

cat >> /etc/apparmor.d/abstractions/libvirt-qemu <<EOF
  /var/lib/libvirt/images/** r,
  /data/win10/** r,
  /run/udev/data/** r,
  /dev/bus/usb/*/[0-9]* rw,
EOF

virsh define ../files/win10_kvm/win10_kvm.xml
