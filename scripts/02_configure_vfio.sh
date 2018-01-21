#!/bin/bash

set -uexo pipefail

install --owner root --group root --mode 0644 ../files/vfio/default_grub_config /etc/defaul/grub

install --owner root --group root --mode 0644 ../files/vfio/modprobe_options /old_disk/etc/modprobe.d/vfio.conf

install --owner root --group root --mode 0644 ../files/vfio/modules_to_be_loaded /etc/modules

install --owner root --group root --mode 0644 ../files/vfio/modules_not_to_be_loaded /etc/modprobe.d/blacklist.conf

update-initramfs -u
update-grub
