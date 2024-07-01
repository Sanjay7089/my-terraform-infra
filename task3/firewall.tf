resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal-${var.username}"
  network = google_compute_network.vpc_network.name
  project = var.project_id

  dynamic "allow" {
    for_each = {
      icmp = var.enable_firewall_icmp ? "icmp" : null,
      tcp  = var.enable_firewall_tcp  ? "tcp"  : null,
      udp  = var.enable_firewall_udp  ? "udp"  : null
    }
    content {
      protocol = allow.value
      ports    = allow.value == "tcp" || allow.value == "udp" ? ["0-65535"] : null
    }
  }

  source_ranges = [var.subnet_cidr]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-${var.username}"
  network = google_compute_network.vpc_network.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = var.firewall_ssh_ports
  }

  source_ranges = var.firewall_ssh_source_ranges
  target_tags   = var.firewall_ssh_target_tags
}
