variable "project_id" {
  description = "Project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type = string
}

variable "gcr_location" {
  description = "GCR location"
  type = string
  default = "EU"
}

variable "gke_num_nodes" {
  default     = 2
  description = "Number of GKE nodes"
  type        = number
}
