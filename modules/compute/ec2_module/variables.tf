# bastion_variables
variable "bastion_key_name" {
  description = "bastion_key_name"
  type = string
}

variable "bastion_subnet_id" {
  description = "bastion_subnet_id"
  type = string
}

variable "bastion_vpc_security_group_ids" {
  description = "bastion_vpc_security_group_ids"
  type = list(string)
}

variable "bastion_tags" {
  description = "bastion_tags"
  type = map(string)
}


# app_1 & app_2 variables
variable "app_key_name" {
  description = "app_1_key_name"
  type = string
}

variable "app_vpc_security_group_ids" {
  description = "app_1_vpc_security_group_ids"
  type = list(string)
}

variable "user_data" {
  description = "The Base64-encoded user data to provide when launching the instance"
  type        = string
  default     = null
}

variable "app_1_subnet_id" {
  description = "app_1_subnet_id"
  type = string
}

variable "app_1_tags" {
  description = "app_1_tags"
  type = map(string)
}

variable "app_2_subnet_id" {
  description = "app_1_subnet_id"
  type = string
}

variable "app_2_tags" {
  description = "app_1_tags"
  type = map(string)
}

/*
# local value/variable
locals {
    user_data = null
    # in root module use this below line & define local variable in root module
    # user_data                   = base64encode(local.root_user_data)
}
*/

# variables for target_group & load balancer
variable "vpc_id" {
  description = "vpc_id"
  type = string
}

variable "target_group_name" {
  description = "target_group_name"
  type = string
}

variable "alb_name" {
  description = "alb_name"
  type = string
}

variable "load_balancer_type" {
  description = "load_balancer_type"
  type = string
}

variable "alb_subnets" {
  description = "alb_subnets"
  type = list(string)
}

variable "alb_sg" {
  description = "alb_sg"
  type = list(string)
}

