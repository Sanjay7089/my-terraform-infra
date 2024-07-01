resource "google_sql_database_instance" "instance" {
  name             = "q-terraform-${var.username}-sql-instance"
  region           = var.region
  database_version = var.db_version

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = var.db_tier

    dynamic "database_flags" {
      for_each = {
        log_disconnections = var.log_disconnections ? { name = "log_disconnections", value = "on" } : null,
        log_statement      = { name = "log_statement", value = var.log_statement },
        log_temp_files     = { name = "log_temp_files", value = tostring(var.log_temp_files) }
      }
      content {
        name  = database_flags.value.name
        value = database_flags.value.value
      }
    }

    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc_network.id
    }
  }

  deletion_protection = false
}
