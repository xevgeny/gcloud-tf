# This script creates Deep Learning VM
# CLI example: https://cloud.google.com/deep-learning-vm/docs/quickstart-cli

provider "google" {
  project = "${var.project_id}"
}

data "google_compute_image" "deep_learning_image" {
  # https://cloud.google.com/deep-learning-vm/docs/images

  family  = "tf2-latest-gpu"
  project = "deeplearning-platform-release"
}

resource "google_compute_instance" "deep_learning_vm" {
  # https://cloud.google.com/compute/docs/machine-types

  name         = "deep-learning-vm"
  machine_type = "n1-standard-4"
  zone         = "europe-west4-b"

  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.deep_learning_image.self_link}"
    }
  }

  scheduling {
    on_host_maintenance = "TERMINATE"
  }

  # Note 1: that GPU availability is limited to certain zones
  # Note 2: GPU accelerators can only be used with on_host_maintenance option set to TERMINATE.
  #
  # GPU types: https://cloud.google.com/compute/docs/gpus/

  guest_accelerator {
    type  = "nvidia-tesla-t4"
    count = 1
  }

  metadata = {
    install-nvidia-driver = "True"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
