output "id" {
  description = "The policy's ID"
  value       = try(module.iam_policy.id, "")
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = try(module.iam_policy.arn, "")
}

output "description" {
  description = "The description of the policy"
  value       = try(module.iam_policy.description, "")
}

output "name" {
  description = "The name of the policy"
  value       = try(module.iam_policy.name, "")
}

output "path" {
  description = "The path of the policy in IAM"
  value       = try(module.iam_policy.path, "")
}

output "policy" {
  description = "The policy document"
  value       = try(module.iam_policy.policy, "")
}