resource "google_bigquery_dataset" "dataset" {
  dataset_id = "q_terraform_${var.username}_db"
  location   = var.location
  project    = var.project_id
}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = var.table_id
  project    = var.project_id

  schema = file("${path.module}/schema.json")
}
