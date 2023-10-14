# dev_db_endpoint
output "dev_db_endpoint" {
  description = "dev_db_endpoint"
  value       = module.dev_db.rds_endpoint
}

