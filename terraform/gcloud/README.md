# Instructions on Setting up Google Cloud

The following deploys an Ubuntu 16.04 LTS f1.micro Google Cloud Compute Engine VM. It automatically installs Docker and a [bitcoind Docker image](https://hub.docker.com/r/bcawthra/bitcoind/). It automatically updates daily, both Ubuntu patches and pulling a new Docker image.

Please note...  the default uses the free `f1.micro` instance. This is a .6 GB RAM system.  It's not great. It would be recommended to edit the [variables.tf](https://github.com/bonovoxly/bitcoin-node/blob/master/terraform/gcloud/variables.tf) and use a `g1.small`, which is a 1.7 GB RAM system.

## Requirements 

These instructions assume that you:

- have a Google Cloud account
- have the Google Cloud SDK installed and configured.
- Terraform version 0.10.X or 0.11.X

### Google Configuration

These instructions are based loosely on [Google's recommended instructions](https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform).

Albeit, slightly different... Assuming you have gcloud setup properly and ready to go:

- Create the project:

```
gcloud projects create bitcoin-node
```

- You may need to get the project ID.  it's a unique identifier to the project name.  [It can be found on the Google Cloud Platform web interface](https://console.cloud.google.com/home), or through the SDK:

```
gcloud projects list
```

- Set it to the default (useful for future commands):

```
gcloud config set project bitcoin-node-<NUMBER>
```

- Next you'll need your billing account ID.  [It can be found on the Google Cloud Platform billing page](https://console.cloud.google.com/billing), or through the SDK:

```
gcloud alpha billing accounts list
```

- Now, we can enable billing for that project:

```
gcloud beta billing projects link bitcoin-node-<NUMBER> --billing-account <BILLING-ACCOUNT-NUMBER>
```

- Configure the Terraform service account. [It can be found on the Google Cloud Platform IAM page](https://console.cloud.google.com/iam-admin/serviceaccounts), or through the SDK:

```
gcloud iam service-accounts create bitcoin-node-terraformm --display-name "Bitcoin-node Terraform account"
gcloud iam service-accounts keys create ~/.config/bitcoin-node-terraform.json --iam-account bitcoin-node-terraform@bitcoin-node-<NUMBER>.iam.gserviceaccount.com
gcloud projects add-iam-policy-binding bitcoin-node-<NUMBER> --member serviceAccount:bitcoin-node-terraform@bitcoin-node-<NUMBER>.iam.gserviceaccount.com --role roles/viewer
```

- Enable the Compute API -
 
```
gcloud services enable compute.googleapis.com
```

- (Skipping over the remote storage for Terraform for now;  will add later).
- Configure environment variables:

```
export GOOGLE_CREDENTIALS=$(cat ~/.config/bitcoin-node-terraform.json)
export GOOGLE_PROJECT=bitcoin-node-<NUMBER>
```

- And that should be it! Now to Terraform...

```
terraform init
terraform plan
terraform apply
```

Note the above will ask you for your project ID (the `bitcoin-node-<NUMBER>`). You can add a `default` value in the `variables.tf` file to remove this prompt. Once deployed, you'll have a full node syncing up with the Bitcoin network. [Head to the Google Cloud Compute page to monitor the newly created bitcoin-node instance](https://console.cloud.google.com/compute).

To SSH to your instance, you can use the gcloud interface:

```
gcloud compute --project "bitcoin-node-<NUMBER>" ssh --zone "us-west1-a" "bitcoin-node"
```


# Links

- Google's Terraform instructions - <https://cloud.google.com/community/tutorials/managing-gcp-projects-with-terraform>
