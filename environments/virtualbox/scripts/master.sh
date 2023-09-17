#!/bin/bash

apt install jq -y
puppet resource package puppetserver ensure=latest
echo '127.0.0.1 puppet' >> /etc/hosts

