

resource "google_container_registry" "registry" {
  project  = var.project_id
  location = var.location
}

resource "google_storage_bucket_iam_binding" "bindings" {
  for_each = var.iam
  bucket   = google_container_registry.registry.id
  role     = each.key
  members  = each.value
}
