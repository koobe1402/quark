#!/bin/bash

set -uexo pipefail

# Update and install required packages
apt update -y
apt upgrade -y

apt install -y wireless-tools \
               wpasupplicant  \
               openssh-server \
               iotop          \
               htop           \
               vim            \
               tree           \
               qemu-kvm       \
               libvirt-bin    \
               bridge-utils   \
               hugepages      \
               qemu-utils     \
               ovmf           \
               xfsprogs


