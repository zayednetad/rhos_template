#!/bin/bash
# Copyright 2020 Red Hat Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

# Here we sadly just expect that if we can't run 'neutron-db-manage current'
# then it means we already updated. If there is any issue with the service the
# upgrade will continue regardless...
neutron-db-manage --subproject neutron current && neutron-db-manage upgrade heads
exit 0
