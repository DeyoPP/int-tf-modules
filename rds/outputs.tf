output "db_password" {

  value       = random_password.master_password.result
  sensitive   = true
}

# Define output for database name and endpoint
output "db_name" {
  description = "The name of the DB."
  value = module.db.db_name
}

output "db_endpoint" {
  description = "The DB endpoint."
  value = module.db.endpoint
}