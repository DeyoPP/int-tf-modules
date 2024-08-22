output "release_name" {
  description = "The name of the Helm release."
  value       = helm_release.external_secrets.name
}

output "namespace" {
  description = "The namespace where External Secrets is deployed."
  value       = var.namespace
}
