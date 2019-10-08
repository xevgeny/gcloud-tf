provider "google" {
  credentials = "${file("service-account.json")}"
  project     = "${var.project_id}"
  region      = "${var.project_region}"
}
