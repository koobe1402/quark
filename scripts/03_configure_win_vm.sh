#!/bin/bash

set -uexo pipefail

install --owner root --group root --mode 0600 ../files/win10_kvm/win10_VARS.fd /var/lib/libvirt/qemu/nvram/win10_VARS.fd

install --owner root --group root --mode 0600 ../files/win10_kvm/vga.rom /var/lib/libvirt/images/vga.rom

virsh define ../files/win10_kvm/win10_kvm.xml
