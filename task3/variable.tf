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
# related to db 

variable "db_version" {
  description = "version u wanna create like postgresss or mysql"
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
