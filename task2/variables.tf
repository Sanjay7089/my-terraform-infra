variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "username" {
  description = "Username for the dataset name"
  type        = string
}

variable "table_id" {
  description = "The ID of the BigQuery table"
  type        = string
  default     = "JSON_table"
}

variable "location" {
  description = "The location for the BigQuery dataset"
  type        = string
  default     = "US"
}

