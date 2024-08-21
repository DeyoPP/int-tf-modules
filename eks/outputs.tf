output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority" {
  description = "The base64 encoded certificate data required to communicate with the EKS cluster"
  value       = module.eks.cluster_certificate_authority_data
}
