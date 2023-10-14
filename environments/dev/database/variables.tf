# Generic variables
variable "region" {
  description = "Region code"
  type        = string
}


# rds variables
variable "dev_db_identifier" {}
variable "dev_db_engine" {}
variable "dev_db_db_name" {}
variable "dev_db_username" {}
variable "dev_db_password" {}
variable "dev_db_instance_class" {}
variable "dev_db_allocated_storage" {}
variable "dev_db_multi_az" {}
variable "dev_db_availability_zone" {}
variable "dev_db_port" {}
variable "dev_db_publicly_accessible" {}
variable "dev_db_skip_final_snapshot" {}
variable "dev_db_delete_automated_backups" {}
