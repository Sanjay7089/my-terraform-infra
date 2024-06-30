output "instance_name" {
  description = "The name of the created Cloud SQL instance"
  value       = google_sql_database_instance.instance.name
}

output "private_ip_address" {
  description = "The private IP address of the Cloud SQL instance"
  value       = google_sql_database_instance.instance.private_ip_address
}

output "connection_name" {
  description = "The connection name of the instance to be used in connection strings"
  value       = google_sql_database_instance.instance.connection_name
}