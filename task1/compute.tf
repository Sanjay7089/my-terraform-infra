# Create a single VM instance
resource "google_compute_instance" "nginx" {
  name         = var.compute_name
  machine_type = var.machine-type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
  }

  metadata_startup_script = file("${path.module}/scripts/install_nginx.sh")

  tags = ["nginx", "http-server"]
}

# Create an unmanaged instance group
resource "google_compute_instance_group" "nginx" {
  name        = var.umig_name
  description = var.umig_description
  zone        = var.zone
  network     = google_compute_network.vpc.self_link

  instances = [
    google_compute_instance.nginx.self_link
  ]

  named_port {
    name = "http"
    port = 80
  }
}
