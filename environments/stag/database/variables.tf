# Generic variables
variable "region" {
  description = "Region code"
  type        = string
}


# rds variables
variable "stag_db_identifier" {}
variable "stag_db_engine" {}
variable "stag_db_db_name" {}
variable "stag_db_username" {}
variable "stag_db_password" {}
variable "stag_db_instance_class" {}
variable "stag_db_allocated_storage" {}
variable "stag_db_multi_az" {}
variable "stag_db_availability_zone" {}
variable "stag_db_port" {}
variable "stag_db_publicly_accessible" {}
variable "stag_db_skip_final_snapshot" {}
variable "stag_db_delete_automated_backups" {}
