#!/bin/bash

if [ $# -eq 0 ]; then
  echo "error: no argument provided"
  exit 1
fi

case $1 in
  "os-ubuntu-18")
    cd /tmp
    wget http://apt.puppetlabs.com/puppet7-release-bionic.deb
    dpkg -i puppet7-release-bionic.deb
    apt-get update
    apt-get -y install puppet-agent
    export PATH=/opt/puppetlabs/bin:$PATH
    echo "PATH=/opt/puppetlabs/bin:$PATH" >> /etc/bash.bashrc
    echo "export PATH" >> /etc/bash.bashrc
    ;;
  "os-centos-7")
    yum install -y http://yum.puppetlabs.com/puppet/puppet7-release-el-7.noarch.rpm
    yum -y install puppet-agent
    export PATH=/opt/puppetlabs/bin:$PATH
    echo "PATH=/opt/puppetlabs/bin:$PATH" >> /etc/bashrc
    echo "export PATH" >> /etc/bashrc
    ;;
  "role-server")
    apt install jq -y
    puppet resource package puppetserver ensure=latest
    echo '127.0.0.1 puppet' >> /etc/hosts
    ;;
  "role-agent")
    cat << EOF >> "/etc/puppetlabs/puppet/puppet.conf"
    [main]
    certname = node.domain.com.br
    server = server.domain.com.br
    environment = production
    [agent]
    report = true
EOF
    ;;
  "action-sign-certs")
    qtd=$(/opt/puppetlabs/bin/puppetserver ca list --format json | jq '.requested | length - 1')
    for i in $(seq 0 $qtd)
    do cert_list[$i]=`/opt/puppetlabs/bin/puppetserver ca list --format json | jq --argjson i "$i" '.requested[$i].name' | sed 's/"//g'`
    done
    for cert in "${cert_list[@]}"
    do /opt/puppetlabs/bin/puppetserver ca sign --certname $cert
    done
    ;;
  *)
    echo "error: invalid option: $1"
    ;;
esac
