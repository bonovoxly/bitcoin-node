# bitcoin-node Terraform

Creates the AWS infrastructure needed to run a (mostly) free tier Bitcoin node. This creates:

- A VPC.
- A single public subnet.
- An Internet Gateway.
- A single t2.micro instance with 250GB of disk (at the time of writing this, the Bitcoin blockchain DB was ~ 150GB).


# quick start

- Export your AWS keys (note - if you have your credentials saved at `~/.aws/config`, you can just source the source script, `source ../source_credentials.sh`).

```
export AWS_ACCESS_KEY_ID=YOURACCESSKEY
export AWS_SECRET_ACCESS_KEY=YOURSECRETKEY
```

- Edit the `variables.tf` accordingly.  Some important ones:
  - `dns` - internal DNS zone to use
  - `env` - the environment, used for tagging/labeling instances.
  - `cidr` - the first two octets of the AWS VPC cidr.  
  - `keypair` - this should be the public SSH key that manages the instances.  Needs to exist in AWS.
  - `rds_password` - the admin AWS MySQL RDS password.
  
- Run Terraform:

```
terraform init
terraform plan
terraform apply
```

