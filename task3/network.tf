resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network-${var.username}"
  auto_create_subnetworks = var.vpc_network_auto_create_subnetworks
  project                 = var.project_id
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "vpc-subnet-${var.username}"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
  project       = var.project_id

  private_ip_google_access = var.vpc_subnet_private_ip_google_access
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address-${var.username}"
  purpose       = var.gcga_purpose
  address_type  = var.gcga_address_type
  prefix_length = var.private_ip_prefix_length
  network       = google_compute_network.vpc_network.id
  project       = var.project_id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc_network.id
  service                 = var.service_networking_service
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}
