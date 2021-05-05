terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.52.0"
    }
  }
  required_version = "~> 0.15"
  backend "remote" {
    organization = "gcp-demo-ksiedlarek"

    workspaces {
      name = "gke-base-infra"
    }
  }
}
