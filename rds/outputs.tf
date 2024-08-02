output "db_password" {

  value       = random_password.master_password.result
  sensitive   = true
}

# Define output for database name and endpoint
output "db_name" {
  description = "The name of the database"
  value = module.db.db_name
}

output "db_endpoint" {
  description = "The database endpoint."
  value = module.db.endpoint
}