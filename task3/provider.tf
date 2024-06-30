provider "google" {
  project = var.project_id
  region  = var.region
}


# import {
#   to = google_compute_network.existing_vpc
#   id = "projects/${var.project_id}/global/networks/${var.vpc_name}"
# }
