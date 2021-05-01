# Purpose

This repository is based on official HashiCorp tutorial that can be found [here](https://learn.hashicorp.com/tutorials/terraform/gke).
You can use it to deploy simple GKE cluster on your account (inside of custom VPC).
To do so:

1. [Install Terraform (version: 0.15)](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
2. Adjust terraform.tfvars - add values for your own project id and region that you would like to use.
3. Inside gke-infra folder run:
```
gcloud init
terraform init
terrafom plan
terrafom apply
```
4. Approve terraform apply and wait for around 10mins for cluster to deploy.

**This infrastructure will generate costs, check documentation to learn more.**

This infrastructure is only a demo, it does not contain production-ready environment.
