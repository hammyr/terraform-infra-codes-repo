/*
-Explanation: how to define output block in root module from child module output 
block, see:

value = module.<root-module-block-name>.<child-module-output-block-name>

-below see & observer
*/


output "stag_vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

# public subnetes outputs
output "stag_public_subnet_1_id" {
  description = "List of IDs of public subnets"
  value       = module.network.public_subnet_1
}

output "stag_public_subnet_2_id" {
  description = "List of IDs of public subnets"
  value       = module.network.public_subnet_2
}

output "stag_public_rt_id" {
  description = "List of IDs of public route tables"
  value       = module.network.public_route_table_ids
}

# private_subnets outputs
output "stag_private_subnet_1_id" {
  description = "List of IDs of private subnets"
  value       = module.network.private_subnet_1
}

output "stag_private_subnet_2_id" {
  description = "List of IDs of private subnets"
  value       = module.network.private_subnet_2
}

output "stag_private_rt_id" {
  description = "List of IDs of private route tables"
  value       = module.network.private_route_table_ids
}

# db subnets
output "stag_db_subnet_id_1" {
  description = "List of IDs of database subnets"
  value       = module.network.database_subnets_1
}

output "stag_db_subnet_id_2" {
  description = "List of IDs of database subnets"
  value       = module.network.database_subnets_2
}

output "stag_db_rt_id" {
  description = "List of IDs of database route tables"
  value       = module.network.database_route_table_ids
}


/*
#value = module.<root-module-block-name>.<child-module-output-block-name>
*/

# bastion_sg output
output "root_module_stag_bastion_sg_id" {
  description = "dev_bastion_sg_id"
  value       = module.all_sg.security_group_ids
}

# alb_sg output
output "root_module_stag_alb_sg_id" {
  description = "dev_alb_sg_id"
  value       = module.all_sg.dev_alb_sg_id
}

# app_sg output
output "root_module_stag_app_sg_id" {
  description = "dev_app_sg_id"
  value       = module.all_sg.dev_app_sg_id
}

# db_sg output
output "root_module_stag_db_sg_id" {
  description = "dev_db_sg_id"
  value       = module.all_sg.dev_db_sg_id
}

