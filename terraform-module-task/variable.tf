variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The region to deploy resources"
}

variable "zone" {
  description = "The zone to deploy the VM"
}

variable "username" {}

variable "machine_type" {}
variable "image" {}
variable "startup_script" {}

variable "auto_create_subnetworks" {}
variable "subnet_cidr" {}

variable "nat_ip_allocate_option" {}
variable "source_subnetwork_ip_ranges_to_nat" {}