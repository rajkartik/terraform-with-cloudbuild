

output "bucket_id" {
  description = "ID of the GCS bucket created."
  value       = google_container_registry.registry.id
}
