# rds variables
variable "identifier" {
  description = "dn identifier"
  type = string
  default = null            #optional, thats why put 'null'
}

variable "engine" {
  description = "db engine"
  type = string
}

variable "db_name" {
  description = "db_name"
  type = string
  default = null
}

variable "username" {
  description = "db_username"
  type = string
}

variable "password" {
  description = "db_password"
  type = string
}

variable "instance_class" {
  description = "db instance_class"
  type = string
}

variable "allocated_storage" {
  description = "db allocated_storage"
  type = string
}

variable "db_subnet_group_name" {
  description = "db_subnet_group_name"
  type = string
  default = null
}

variable "multi_az" {
  description = "db multi_az"
  type = string
  default = null
}

variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
  type = list(string)
  default = null
}

variable "availability_zone" {
  description = "db availability_zone"
  type = string
  default = null
}

variable "port" {
  description = "db port"
  type = string
  default = null
}

variable "publicly_accessible" {
  description = "db publicly_accessible"
  type = string
  default = null
}

variable "skip_final_snapshot" {
  description = "db skip_final_snapshot"
  type = string
  default = null
}

variable "delete_automated_backups" {
  description = "db delete_automated_backups"
  type = string
  default = null
}
