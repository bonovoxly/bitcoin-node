# bitcoin-node

This project deploys a Bitcoin node to AWS, using Terraform (and a little Ansible). It's meant to help users quickly run a full Bitcoin node, in a very automated fashion. It currently deploys a t2.micro instance with 250 GB disk (for the Bitcoin blockchain).

It was more of an ansible-pull experiment. Hopefully I'll extend this to other clouds and blockchains in the near future.

[The big AWS blog post can be found here](https://blog.billyc.io/2017/11/20/deploying-a-bitcoin-node-using-terraform-and-ansible-pull/).
[Quick Google Cloud summary blog post can be found here](https://blog.billyc.io/2017/11/23/deploying-a-bitcoin-node-to-google-cloud-using-terraform-and-ansible-pull/).

# AWS

This deploys a t2.micro instance with 250 GB of hard drive space to AWS using Terraform and ansible-pull. [Instructions on deploying a Bitcoin node to Google Cloud can be found here](https://github.com/bonovoxly/bitcoin-node/tree/master/terraform/aws).

# Google Cloud Plathform

This deploys a `g1.small` instance with 250 GB of hard drive space to Google Cloud using Terraform and ansible-pull. [Instructions on deploying a Bitcoin node to Google Cloud can be found here](https://github.com/bonovoxly/bitcoin-node/tree/master/terraform/gcloud).

# Thanks and Links

- Bitcoin node Ansible deployment playbook (ansible-pull runs this) - <https://github.com/bonovoxly/bitcoin-node/tree/master/ansible>
- Thanks to [James for the super simple Dockerfile that I forked.](https://github.com/jamesob/docker-bitcoind)
- ansible-pull reference - <https://docs.ansible.com/ansible/2.4/ansible-pull.html>

If you find this useful and want to contribute:

- BTC: `161a2z4A5J5ndVyytBXroN8hGcf6Cc8RA5`
- Ethereum: `0x9de200ba61af4a58c9fced2c1334110087a75f51`
- Litecoin: `LMGHysobMGv9dWUg1s6CDYP78HSasX8gTp`
