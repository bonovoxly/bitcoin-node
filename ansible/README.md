# bitcoin-node ansible playbook

This is the Ansible playbook section. Note that this is currently meant to be run with `ansible-pull`. The actual command that gets run on the instance is:

```
HOME=/root ansible-pull -d /opt/bitcoin-node -U https://github.com/bonovoxly/bitcoin-node /opt/bitcoin-node/ansible/bitcoin_node.yml >> /var/log/ansible-pull.log
```

