#!/bin/bash

yum install -y http://yum.puppetlabs.com/puppet/puppet7-release-el-7.noarch.rpm

yum -y install puppet-agent

export PATH=/opt/puppetlabs/bin:$PATH
echo "PATH=/opt/puppetlabs/bin:$PATH" >> /etc/bashrc
echo "export PATH" >> /etc/bashrc
