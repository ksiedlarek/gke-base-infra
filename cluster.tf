# GKE cluster
resource "google_container_cluster" "primary" {
  name        = "${var.project_id}-gke"
  description = "test cluster for demo purposes"
  # uncomment if you want resources to be regional and not zonal (and comment out zone below)
  #location    = var.region
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
  # you can privide more detailed configuration if needed:
  # enable_binary_authorization = true
  #   addons_config {
  #       network_policy_config  {
  #         disabled = false
  #       }
  #   }
  # database_encryption {
  #   state = "ENCRYPTED"
  #   key_name = ""
  # }
  # istio_config {
  #     disabled = false
  # }
  #service_account = ""
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  # uncomment if you want resources to be regional and not zonal (and comment out zone below)
  #location   = var.region
  location = var.zone

  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    labels = {
      env = var.project_id
    }

    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
