output "table_name" {
  description = "Name of provisioned DynamoDB table"
  value       = module.dynamodb-table.dynamodb_table_id
}

output "table_arn" {
  description = "ARN of provisioned DynamoDB table"
  value       = module.dynamodb-table.dynamodb_table_arn
}