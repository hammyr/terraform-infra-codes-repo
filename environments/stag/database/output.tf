# stag_db_endpoint
output "stag_db_endpoint" {
  description = "stag_db_endpoint"
  value       = module.stag_db.rds_endpoint
}

