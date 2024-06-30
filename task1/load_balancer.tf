# Global IP address for the load balancer
resource "google_compute_global_address" "default" {
  name = var.gip_lb_name
}

# Health check configuration
resource "google_compute_health_check" "default" {
  name               = var.ahc_lb_name
  check_interval_sec = 5
  timeout_sec        = 5
  http_health_check {
    port = 80
  }
}

# Backend service configuration
resource "google_compute_backend_service" "default" {
  name        = var.backend_service_name
  protocol    = var.backend_service_protocol
  port_name   = var.backend_service_prot_name
  timeout_sec = var.backend_service_timeout_sec

  health_checks = [google_compute_health_check.default.id]

  backend {
    group = google_compute_instance_group.nginx.self_link
  }
}

# URL map to route requests to the backend service
resource "google_compute_url_map" "default" {
  name            = var.urlmap_name
  default_service = google_compute_backend_service.default.id
}

# HTTP proxy to route requests to the URL map
resource "google_compute_target_http_proxy" "default" {
  name    = var.hhtp_proxy_name
  url_map = google_compute_url_map.default.id
}

# Global forwarding rule to route incoming requests to the proxy
resource "google_compute_global_forwarding_rule" "default" {
  name       = var.forwarding_rule_name
  target     = google_compute_target_http_proxy.default.id
  port_range = var.forwarding_rule_port_range
  ip_address = google_compute_global_address.default.address
}
