#!/bin/bash

set -uexo pipefail

# Create directories and configure fstab
if [ ! -d "/data" ]; then
  mkdir /data
fi

if [ ! -d "/data/win10" ]; then
  mkdir -p /data/win10
fi

cat >> /etc/fstab <<EOF

/dev/mapper/win10vg-win10lv /data/win10 xfs    user,nosuid,exec,nodev,nofail  0       0

EOF

# Mount everything
mount -a
