# bitcoin-node Terraform

Creates the AWS infrastructure needed to run a (mostly) free tier Bitcoin node. This creates:

- A VPC.
- Three public subnets.
- An Internet Gateway.
- A single t2.micro instance with 250GB of disk space (at the time of writing this, the Bitcoin blockchain DB was ~ 150GB). This instance is bootstrapped using AWS User Data to run `ansible-pull`, pulling https://github.com/bonovoxly/bitcoin-node.


# quick start

- Export your AWS keys.

```
export AWS_ACCESS_KEY_ID=YOURACCESSKEY
export AWS_SECRET_ACCESS_KEY=YOURSECRETKEY
```

- Edit the `variables.tf` accordingly.  Some important ones:
  - `env` - the environment, used for tagging/labeling instances.
  - `cidr` - the first two octets of the AWS VPC cidr.  
  - `keypair` - this should be the public SSH key that manages the instances.  Needs to exist in AWS.
  
- Run Terraform:

```
terraform init
terraform plan
terraform apply
```

