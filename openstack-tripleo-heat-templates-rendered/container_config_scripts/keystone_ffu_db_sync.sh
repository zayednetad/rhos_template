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

set -e

DB_VERSION=$( /usr/local/bin/kolla_set_configs && /usr/bin/keystone-manage --config-file /etc/keystone/keystone.conf db_version )
_RPM_VERSION=$(ls /usr/lib/python3.6/site-packages/keystone/common/sql/migrate_repo/versions | grep -e '[0-9]_.*.py' | cut -d '_' -f1 | sort | tail -n1)
RPM_VERSION=$(expr $_RPM_VERSION + 0);
if (( $RPM_VERSION > $DB_VERSION )); then
    /usr/local/bin/kolla_start
else
    echo DB_VERSION: $DB_VERSION RPM_VERSION: $RPM_VERSION
fi
