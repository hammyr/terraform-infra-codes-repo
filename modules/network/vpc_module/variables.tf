# vpc variables
variable "vpc_cidr_block" {           #required, thats why not put 'null'
  description = "cidr range for vpc"
  type = string
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type = bool
  default = null        #optional, thats why put 'null'
}

variable "vpc_tags" {
  description = "vpc name"
  type = map(string)
  default = null        #optional, thats why put 'null'
}


# public_subnets variables
variable "public_subnet_1_cidr_block" {
  description = "public_subnet_1_cidr_block"
  type = string
}

variable "public_subnet_1_availability_zone" {
  description = "public_subnet_1_availability_zone"
  type = string
}

variable "map_public_ip_on_launch" {
  description = "map_public_ip_on_launch"
  type = bool
}

variable "public_subnet_1_tags" {
  description = "public_subnet_1_tags"
  type = map(string)
}

variable "public_subnet_2_cidr_block" {
  description = "public_subnet_2_cidr_block"
  type = string
}

variable "public_subnet_2_availability_zone" {
  description = "public_subnet_1_availability_zone"
  type = string
}

variable "public_subnet_2_tags" {
  description = "public_subnet_2_tags"
  type = map(string)
}


# priavte_subnets variables
variable "private_subnet_1_cidr_block" {
  description = "private_subnet_1_cidr_block"
  type = string
}

variable "private_subnet_1_availability_zone" {
  description = "private_subnet_1_availability_zone"
  type = string
}

variable "private_subnet_1_tags" {
  description = "private_subnet_1_tags"
  type = map(string)
}

variable "private_subnet_2_cidr_block" {
  description = "private_subnet_2_cidr_block"
  type = string
}

variable "private_subnet_2_availability_zone" {
  description = "private_subnet_2_availability_zone"
  type = string
}

variable "private_subnet_2_tags" {
  description = "private_subnet_2_tags"
  type = map(string)
}

# db_subnets variables
variable "db_subnet_1_cidr_block" {
  description = "db_subnet_1_cidr_block"
  type = string
}

variable "db_subnet_1_availability_zone" {
  description = "db_subnet_1_availability_zone"
  type = string
}

variable "db_subnet_1_tags" {
  description = "db_subnet_1_tags"
  type = map(string)
}

variable "db_subnet_2_cidr_block" {
  description = "db_subnet_1_cidr_block"
  type = string
}

variable "db_subnet_2_availability_zone" {
  description = "db_subnet_1_availability_zone"
  type = string
}

variable "db_subnet_2_tags" {
  description = "db_subnet_1_tags"
  type = map(string)
}

# igw variable
variable "igw_tags" {
  description = "igw_tags"
  type = map(string)
}

# nat_gw variable
variable "nat_gw_tags" {
  description = "nat_gw_tags"
  type = map(string)
}


# route tables variables
variable "public_rt_1_tags" {
  description = "public_rt_1_tags"
  type = map(string)
}

variable "private_rt_1_tags" {
  description = "private_rt_1_tags"
  type = map(string)
}

variable "db_rt_1_tags" {
  description = "db_rt_1_tags"
  type = map(string)
}
