# bitcoin-node

This project deploys a Bitcoin node to AWS, using Terraform (and a little Ansible). It's meant to help users quickly run a full Bitcoin node, in a very automated fashion.

# Requirements

- An AWS account.
- [AWS access and secret keys associated with that account](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys).
- Terraform v0.10.6 or later.

# Deployment

- Set your AWS access and secret keys as environment variables:

```
export AWS_ACCESS_KEY_ID=YOURACCESSKEY
export AWS_SECRET_ACCESS_KEY=YOURSECRETKEY
```

- In the `terraform` directory, initialize and plan Terraform:

```
terraform init
terraform plan
```

- Review the changes. If everything looks `green`, apply:

```
terraform apply
```

- And wait a few minutes. If all goes according to play, there should be an instance in us-east-1a that is syncing up with the Bitcoin network and will be destined to operate as a full node.

# Thanks and Links

- Bitcoin node Ansible deployment playbook (ansible-pull runs this) - <https://github.com/bonovoxly/bitcoin-node/tree/master/ansible>
- Thanks to [James for the super simple Dockerfile that I forked.](https://github.com/jamesob/docker-bitcoind)
- ansible-pull reference - <https://docs.ansible.com/ansible/2.4/ansible-pull.html>

# Tips

If you find this useful and want to contribute:

- BTC: `161a2z4A5J5ndVyytBXroN8hGcf6Cc8RA5`
![Bitcoin](https://blog.billyc.io/img/bitcoin.png)
- Litecoin: `LMGHysobMGv9dWUg1s6CDYP78HSasX8gTp`
![Litecoin](https://blog.billyc.io/img/litecoin.png)
