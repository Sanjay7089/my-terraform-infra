resource "google_compute_router" "router" {
  name    = "${var.username}-router"
  region  = var.region
  network = var.network_self_link
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.username}-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}