#!/bin/bash

# Install kernel 4.13.16 with ACS patch applied
# https://queuecumber.gitlab.io/linux-acs-override/
# ACS patch is used to bypass IOMMU groups

dpkg -i ../files/acs_kernel/linux-*.deb
