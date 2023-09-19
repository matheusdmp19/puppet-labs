#!/bin/bash

vagrant up

vagrant ssh-config > ssh.conf
ssh -F ssh.conf server 'sudo chmod +x /vagrant/scripts/provision.sh'
ssh -F ssh.conf server 'sudo /vagrant/scripts/provision.sh action-sign-certs'
