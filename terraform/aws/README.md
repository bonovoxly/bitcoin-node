# bitcoin-node Terraform

Creates the AWS infrastructure needed to run a (mostly) free tier Bitcoin node. This creates:

- A VPC.
- Three public subnets.
- An Internet Gateway.
- A single t2.micro instance with 250GB of disk space (at the time of writing this, the Bitcoin blockchain DB was ~ 150GB). This instance is bootstrapped using AWS User Data to run `ansible-pull`, pulling https://github.com/bonovoxly/bitcoin-node.

These are the instructions for deploying to AWS.

## Requirements

- [An AWS account](https://aws.amazon.com/resources/create-account/).
- [AWS access and secret keys associated with that account](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys).
- An SSH public key uploaded to the AWS account. This defaults to the name `dev`.
- Terraform v0.10.6 or later.

## Deployment

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
- This is the part where ansible-pull is automagically run on the instance. The instance will pull this repository and run the [bitcoin_node.yml](https://github.com/bonovoxly/bitcoin-node/tree/master/ansible) playbook to configure the instance and start bitcoind.

