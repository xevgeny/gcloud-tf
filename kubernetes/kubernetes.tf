# https://www.terraform.io/docs/providers/google/r/container_cluster.html

provider "google" {
  project = "${var.project_id}"
}

resource "google_container_cluster" "primary" {
  name = "test-cluster"

  # If you specify a zone (such as us-central1-a), 
  # the cluster will be a zonal cluster with a single cluster master.
  location = "europe-west4-c"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "test-node-pool"
  location   = "europe-west4-c"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
  }
}
