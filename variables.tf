variable "project_id" {
  description = "project id"
  type = string
}

variable "region" {
  description = "region"
  type = string
}

variable "gke_username" {
  default     = "admin"
  description = "GKE username"
  type = string
}

variable "gke_password" {
  description = "GKE password"
  sensitive = true
  type = string
}

variable "gke_num_nodes" {
  default     = 2
  description = "Number of GKE nodes"
  type = number
}
