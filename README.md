# Purpose

This repository is needed for sample app deployments in GCP, that can be found here: [gke-sample-app-deployment](https://github.com/ksiedlarek/gke-sample-app-deployments)
All of the code is based on official HashiCorp tutorial that can be found [here](https://learn.hashicorp.com/tutorials/terraform/gke).
You can use it to deploy: vpc & subnet, GKE cluster, GCR.

To do so:

1. [Install Terraform (version: 0.15+)](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
4. Log in to your GCP project from command line ([gcloud init](https://cloud.google.com/sdk/gcloud/reference/init))
5. [Optional] Create terraform.auto.tfvars - add variable values for region, zone, project_id and gke_password (you will be prompted to provide them if you won't create this file).
6. Change backend configuration in terraform_config.tf - use your own Terraform Organisation and Workspace - if you don't want to use [Terraform Cloud](https://www.terraform.io/cloud) - change backend type to local.
If you will use Terraform Cloud, log in prior to running below commands with: `terraform login`
While creating namespace: make sure to set execution mode to local and select CLI-driven runs.

7. Inside gke-infra/ folder run:

```
terraform init
terrafom plan
terrafom apply
```

8. Approve terraform apply and wait for around 10 mins for cluster to deploy.

**This infrastructure will generate costs, check [GCP documentation](https://cloud.google.com/kubernetes-engine/pricing) to learn more.**

This infrastructure is only a demo, it does not contain production-ready environment.
Currently GKE cluster is deployed in single zone.
