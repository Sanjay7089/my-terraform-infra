resource "google_compute_firewall" "allow_iap" {
  name    = "${var.firewall_name_prefix}iap-${var.username}"
  network = google_compute_network.vpc.name // Changed from vpc_name to vpc
  project = var.project_id

  allow {
    protocol = var.iap_firewall_protocol
    ports    = var.iap_firewall_ports
  }

  source_ranges = var.iap_source_ranges
}

resource "google_compute_firewall" "allow_internal" {
  name    = "${var.firewall_name_prefix}internal-${var.username}"
  network = google_compute_network.vpc.name // Changed from vpc_name to vpc
  project = var.project_id

  dynamic "allow" {
    for_each = var.internal_firewall_rules
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  source_ranges = [google_compute_subnetwork.subnet.ip_cidr_range] // Changed from vpc_subnet to subnet
}

resource "google_compute_firewall" "allow_health_check" {
  name    = "${var.firewall_name_prefix}health-check-${var.username}"
  network = google_compute_network.vpc.name // Changed from vpc_name to vpc
  project = var.project_id

  allow {
    protocol = var.health_check_firewall_protocol
    ports    = var.health_check_firewall_ports
  }

  source_ranges = var.health_check_source_ranges
}
