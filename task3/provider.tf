provider "google" {
  project = var.project_id
  region  = var.region
}
data "google_compute_network" "existing_vpc" {
  name    = var.vpc_name
  project = var.project_id
}

import {
  to = google_compute_network.existing_vpc
  id = "projects/${var.project_id}/global/networks/${var.vpc_name}"
}
