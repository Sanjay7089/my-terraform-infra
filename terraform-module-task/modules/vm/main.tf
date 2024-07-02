resource "google_compute_instance" "vm_instance" {
  name         = "${var.username}-vm"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network_self_link
    subnetwork = var.subnet_self_link

  }

  metadata_startup_script = var.startup_script

  tags = ["${var.username}-vm"]

}
