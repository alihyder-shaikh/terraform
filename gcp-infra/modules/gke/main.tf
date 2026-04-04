resource "google_container_cluster" "cluster" {
  name     = var.name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  deletion_protection = false

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"
    services_secondary_range_name = "services-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.master_cidr
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.10.0.0/16"
      display_name = "vpc"
    }
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  release_channel {
    channel = "REGULAR"
  }

  # 🔥 CRITICAL FIX — controls default pool behavior
  node_config {
    machine_type = "e2-small"
    disk_size_gb = 20
    disk_type    = "pd-standard"
  }

  remove_default_node_pool = true
  initial_node_count       = 1
}

# ✅ Your actual node pool (cheap + controlled)
resource "google_container_node_pool" "primary" {
  name     = "cheap-pool"
  cluster  = google_container_cluster.cluster.name
  location = var.region

  node_count = 1

  node_config {
    machine_type = "e2-small"
    disk_size_gb = 20
    disk_type    = "pd-standard"

    preemptible = false

    labels = {
      workload = "backend"
    }


    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
