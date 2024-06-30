terraform {
  backend "gcs" {
    bucket = "q-bucket-sanjayjat-statefile-bucket"
    prefix = "q-terraform-sanjayjat/task3"
  }
}