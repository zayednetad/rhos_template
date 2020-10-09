#!/usr/bin/bash
source ~/stackrc
date
time openstack overcloud deploy \
  --templates \
  --stack vran \
  -r /home/stack/templates/roles_data.yaml \
  -n /home/stack/templates/network_data.yaml \
  -e /home/stack/containers-prepare-parameter.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.j2.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovs.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-sriov.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/host-config-and-reboot.j2.yaml \
  -e /home/stack/templates/node-info.yaml \
  -e /home/stack/inject-trust-anchor-hiera.yaml \
  --ntp-server ntp-d.nist.gov \
  --timeout 90
