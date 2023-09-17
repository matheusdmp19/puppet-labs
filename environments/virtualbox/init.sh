#!/bin/bash

vagrant up

vagrant ssh-config > ssh.conf
ssh -F ssh.conf puppet-server 'sudo chmod +x /vagrant/scripts/sign-certs.sh'
ssh -F ssh.conf puppet-server 'sudo /vagrant/scripts/sign-certs.sh'
