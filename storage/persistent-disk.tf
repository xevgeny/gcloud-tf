# Creates zonal persistent disk that could be attached later

provider "google" {
  project = "${var.project_id}"
}

resource "google_compute_disk" "deep_learning_pd" {
  name  = "deep-learning-pd"
  type  = "pd-ssd"
  zone  = "europe-west4-b"
  size  = 200
}