locals {
  machine_type = "n1-standard-4"
  disk_size_gb = 64
  zone         = "europe-west4-b"

}

provider "google" {
  project = "${var.project_id}"
}

# Arch Linux optimized for GCP
# https://github.com/GoogleCloudPlatform/compute-archlinux-image-builder
data "google_compute_image" "arch_image" {
  project = "arch-linux-gce"
  family  = "arch"
}

resource "google_compute_disk" "arch_ssd" {
  name  = "arch-ssd"
  type  = "pd-ssd"
  zone  = "${local.zone}"
  image = "${data.google_compute_image.arch_image.self_link}"
}

resource "google_compute_instance" "arch_linux_vm" {
  name         = "arch-linux-vm"
  machine_type = "${local.machine_type}"
  zone         = "${local.zone}"

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.arch_image.self_link}"
      size  = "${local.disk_size_gb}"
      type  = "pd-ssd"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
