#!/bin/bash

qtd=$(/opt/puppetlabs/bin/puppetserver ca list --format json | jq '.requested | length - 1')

for i in $(seq 0 $qtd)
do cert_list[$i]=`/opt/puppetlabs/bin/puppetserver ca list --format json | jq --argjson i "$i" '.requested[$i].name' | sed 's/"//g'`
done

for cert in "${cert_list[@]}"
do /opt/puppetlabs/bin/puppetserver ca sign --certname $cert
done