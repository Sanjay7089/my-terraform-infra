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
