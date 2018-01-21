#!/bin/bash

set -uexo pipefail

install --owner root --group root --mode 0600 ../files/win10_kvm/win10_VARS.fd /data/win10/nvram/win10_VARS.fd

install --owner root --group root --mode 0600 ../files/win10_kvm/vga.rom /data/win10/rom/vga.rom

install --owner root --group root --mode 0600 ../files/win10_kvm/qemu.conf /etc/libvirt/qemu.conf

virsh define ../files/win10_kvm/win10_kvm.xml
