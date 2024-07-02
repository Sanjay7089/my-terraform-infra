variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The region to deploy resources"
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy the VM"
  default     = "us-central1-a"
}
variable "username" {
  default = "sanjayjat"

}
variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}
# compute engine 
variable "compute_name" {
  description = "name of vm"

}
variable "machine-type" {
  type = string

}
variable "image" {
  type = string

}
# instance group 

variable "umig_name" {
  type = string
}
variable "umig_description" {
  type = string

}
# health check 
variable "ahc_name" {
  type = string

}
variable "ahc_lb_name" {
  type = string

}
variable "health_check_name" {
  description = "Name of the health check"
  type        = string
}

variable "health_check_interval" {
  description = "How often (in seconds) to send a health check"
  type        = number
  default     = 5
}

variable "health_check_timeout" {
  description = "How long (in seconds) to wait before claiming failure"
  type        = number
  default     = 5
}

variable "health_check_port" {
  description = "The port number to check"
  type        = number
  default     = 80
}

variable "health_check_request_path" {
  description = "The request path of the HTTP health check request"
  type        = string
  default     = "/"
}
# load balancer 
variable "gip_lb_name" {
  type = string
}
variable "backend_service_name" {
  type = string
}
variable "backend_service_protocol" {
  type = string
}
variable "backend_service_prot_name" {
  type = string
}
variable "backend_service_timeout_sec" {
  type = number

}
variable "urlmap_name" {
  type = string
}
variable "hhtp_proxy_name" {
  type = string
}
variable "forwarding_rule_name" {
  type = string

}
variable "forwarding_rule_port_range" {
  type = number
}
# vpc and networking 
# variable "vpc_name" {
#   type = string
# }
# variable "vpc_subnet_name" {
#   type = string

# }
# variable "vpc_subnet_ip_cidr_range" {
#   type = string

# }

# # cloud nat 
# variable "router_name" {
#   type = string
# }
# variable "nat_name" {
#   type = string
# }

variable "auto_create_subnetworks" {
  description = "Whether to create auto subnetworks"
  type        = bool
  default     = false
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "my-subnet"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "router_name" {
  description = "Name of the Cloud Router"
  type        = string
}

variable "nat_name" {
  description = "Name of the Cloud NAT"
  type        = string
}

variable "nat_ip_allocate_option" {
  description = "How external IPs should be allocated for this NAT"
  type        = string
  default     = "AUTO_ONLY"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "How NAT should be configured per Subnetwork"
  type        = string
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}


variable "bucket" {
  type = string

}
variable "prefix" {
  type = string

}
variable "firewall_name_prefix" {
  description = "Prefix for firewall rule names"
  type        = string
  default     = "allow-"
}

variable "iap_firewall_protocol" {
  description = "Protocol for IAP firewall rule"
  type        = string
  default     = "tcp"
}

variable "iap_firewall_ports" {
  description = "Ports for IAP firewall rule"
  type        = list(string)
  default     = ["22"]
}

variable "iap_source_ranges" {
  description = "Source IP ranges for IAP firewall rule"
  type        = list(string)
  default     = ["35.235.240.0/20"]
}

variable "internal_firewall_rules" {
  description = "List of internal firewall rules"
  type = list(object({
    protocol = string
    ports    = list(string)
  }))
  default = [
    {
      protocol = "icmp"
      ports    = []
    },
    {
      protocol = "tcp"
      ports    = ["0-65535"]
    },
    {
      protocol = "udp"
      ports    = ["0-65535"]
    }
  ]
}

variable "health_check_firewall_protocol" {
  description = "Protocol for health check firewall rule"
  type        = string
  default     = "tcp"
}

variable "health_check_firewall_ports" {
  description = "Ports for health check firewall rule"
  type        = list(string)
  default     = ["80"]
}

variable "health_check_source_ranges" {
  description = "Source IP ranges for health check firewall rule"
  type        = list(string)
  default     = ["130.211.0.0/22", "35.191.0.0/16"]
}
