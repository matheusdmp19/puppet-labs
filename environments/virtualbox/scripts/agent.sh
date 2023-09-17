#!/bin/bash

cat << EOF >> "/etc/puppetlabs/puppet/puppet.conf"
[main]
certname = node.domain.com.br
server = server.domain.com.br
environment = production
[agent]
report = true
EOF