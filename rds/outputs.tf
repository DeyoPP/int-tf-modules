output "db_password" {
  description = "The generated master password for the DB."
  value       = random_password.master_password.result
  sensitive   = true
}
