variable "project_id" {
  description = "The ID of the project in which resources will be managed"
  type        = string
}

variable "region" {
  description = "The region to deploy the Cloud SQL instance"
  type        = string
  default     = "us-central1"
}

variable "username" {
  description = "Username to be used in the instance name"
  type        = string
}

variable "db_version" {
  description = "Version of the database you want to create, like PostgreSQL or MySQL"
  type        = string
}

variable "db_tier" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_cidr" {
  description = "The CIDR range for the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "private_ip_prefix_length" {
  description = "Prefix length for the private IP address range"
  type        = number
  default     = 16
}

variable "service_networking_service" {
  description = "The service name for VPC peering"
  type        = string
  default     = "servicenetworking.googleapis.com"
}

variable "firewall_ssh_ports" {
  description = "Ports for SSH firewall rule"
  type        = list(string)
  default     = ["22"]
}

variable "firewall_ssh_source_ranges" {
  description = "Source ranges for SSH firewall rule"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "firewall_ssh_target_tags" {
  description = "Target tags for SSH firewall rule"
  type        = list(string)
  default     = ["ssh-enabled"]
}

variable "log_disconnections" {
  description = "Enable logging of disconnections"
  type        = bool
  default     = true
}

variable "log_statement" {
  description = "Type of SQL statement to log"
  type        = string
  default     = "ddl"
}

variable "log_temp_files" {
  description = "Minimum size of temporary files to log, in kilobytes"
  type        = number
  default     = 0
}

variable "enable_firewall_icmp" {
  description = "Enable ICMP protocol in firewall rules"
  type        = bool
  default     = true
}

variable "enable_firewall_tcp" {
  description = "Enable TCP protocol in firewall rules"
  type        = bool
  default     = true
}

variable "enable_firewall_udp" {
  description = "Enable UDP protocol in firewall rules"
  type        = bool
  default     = true
}

variable "vpc_subnet_private_ip_google_access" {
  type    = bool
  default = true
}

variable "gcga_purpose" {
  type    = string
  default = "VPC_PEERING"
}
variable "gcga_address_type" {
  type    = string
  default = "INTERNAL"
}
variable "vpc_network_auto_create_subnetworks" {
  type    = bool
  default = false
}
