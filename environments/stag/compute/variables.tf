# Generic variables
variable "region" {
  description = "Region code"
  type        = string
}


# bastion_instances variables
variable "bastion_key_name" {}
variable "bastion_tags" {}

# app_1 & app_2 variables
variable "app_key_name" {}
variable "app_1_tags" {}
variable "app_2_tags" {}

# target_group & alb variables
variable "target_group_name" {}
variable "alb_name" {}
variable "load_balancer_type" {}

