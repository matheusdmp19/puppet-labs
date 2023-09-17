#!/bin/bash

cd /tmp
wget http://apt.puppetlabs.com/puppet7-release-bionic.deb
dpkg -i puppet7-release-bionic.deb
apt-get update

apt-get -y install puppet-agent

export PATH=/opt/puppetlabs/bin:$PATH
echo "PATH=/opt/puppetlabs/bin:$PATH" >> /etc/bash.bashrc
echo "export PATH" >> /etc/bash.bashrc
