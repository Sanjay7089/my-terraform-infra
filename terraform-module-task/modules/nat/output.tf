output "nat_ip" {
  value = google_compute_router_nat.nat.nat_ips
}