#!/bin/bash
apt-get update
apt-get -y install python-pip
pip install ansible
HOME=/root ansible-pull -o -d /opt/bitcoin-node -U https://github.com/bonovoxly/bitcoin-node /opt/bitcoin-node/ansible/bitcoin_node.yml >> /var/log/ansible-pull.log

