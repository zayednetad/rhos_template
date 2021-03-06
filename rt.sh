#!/bin/bash
set -eux
date
subscription-manager repos --disable '*' \
--enable=openstack-16.1-for-rhel-8-x86_64-rpms \
--enable=rhel-8-for-x86_64-nfv-rpms \
--enable=advanced-virt-for-rhel-8-x86_64-rpms \
--enable=fast-datapath-for-rhel-8-x86_64-rpms \
--enable=rhel-8-for-x86_64-baseos-eus-rpms \
--enable=rhel-8-for-x86_64-appstream-eus-rpms \
--enable=rhel-8-for-x86_64-highavailability-eus-rpms \
--enable=codeready-builder-for-rhel-8-x86_64-rpms \
--enable=ansible-2.9-for-rhel-8-x86_64-rpms \
--enable=rhceph-4-tools-for-rhel-8-x86_64-rpms

dnf -v -y --setopt=protected_packages= erase kernel.$(uname -m)
dnf -v -y install kernel-rt kernel-rt-kvm tuned-profiles-nfv-host kernel-rt-devel \
kernel-devel gcc make elfutils-libelf-devel libuuid-devel intel-cmt-cat

#grubby --set-default /boot/vmlinuz*rt*
# fix until this gets picked up by tuned
echo "isolate_managed_irq=Y" >> /etc/tuned/realtime-virtual-host-variables.conf
# END OF SCRIPT
