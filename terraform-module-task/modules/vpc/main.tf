resource "google_compute_network" "vpc_network" {
  name                    = "${var.username}-vpc"
  auto_create_subnetworks = var.auto_create_subnetworks
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.username}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.self_link

  private_ip_google_access = true
}

# Firewall rule to allow internal communication
resource "google_compute_firewall" "internal" {
  name    = "${var.username}-allow-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = [var.subnet_cidr]
}

# Firewall rule to allow SSH from IAP
resource "google_compute_firewall" "iap_ssh" {
  name    = "${var.username}-allow-iap-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}