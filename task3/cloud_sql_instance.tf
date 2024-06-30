resource "google_sql_database_instance" "instance" {
  name             = "q-terraform-${var.username}-sql-instance"
  region           = var.region
  database_version = var.db_version

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = var.db_tier
    
    database_flags {
      name  = "log_disconnections"
      value = "on"
    }
    
    database_flags {
      name  = "log_statement"
      value = "ddl"
    }
    
    database_flags {
      name  = "log_temp_files"
      value = "0"
    }
    
    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.existing_vpc.id
    }
  }

  deletion_protection = false
}
