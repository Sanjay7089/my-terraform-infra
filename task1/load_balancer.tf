# Global IP address for the load balancer
resource "google_compute_global_address" "default" {
  name = "lb-ipv4-1"
}

# Health check configuration
resource "google_compute_health_check" "default" {
  name               = "http-health-check"
  check_interval_sec = 5
  timeout_sec        = 5
  http_health_check {
    port = 80
  }
}

# Backend service configuration
resource "google_compute_backend_service" "default" {
  name        = "backend-service"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 10

  health_checks = [google_compute_health_check.default.id]

  backend {
    group = google_compute_instance_group.nginx.self_link
  }
}

# URL map to route requests to the backend service
resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.id
}

# HTTP proxy to route requests to the URL map
resource "google_compute_target_http_proxy" "default" {
  name    = "http-lb-proxy"
  url_map = google_compute_url_map.default.id
}

# Global forwarding rule to route incoming requests to the proxy
resource "google_compute_global_forwarding_rule" "default" {
  name       = "http-content-rule"
  target     = google_compute_target_http_proxy.default.id
  port_range = "80"
  ip_address = google_compute_global_address.default.address
}
