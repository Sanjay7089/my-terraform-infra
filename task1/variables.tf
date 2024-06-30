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
variable "vpc_name" {
  type = string
}
variable "vpc_subnet_name" {
  type = string

}
variable "vpc_subnet_ip_cidr_range" {
  type = string

}

# cloud nat 
variable "router_name" {
  type = string
}
variable "nat_name" {
  type = string
}


# variable "bucket" {
#   type  = string  
# }
# variable "prefix" {
#   type = string

# }
