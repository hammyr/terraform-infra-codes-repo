# DB Subnet Group creation
resource "aws_db_subnet_group" "dev_db_sub_group" {
  name        = "dev_db_sub_group"
  description = "dev_db_sub_group for rds server"
  subnet_ids  = [data.terraform_remote_state.network.outputs.dev_db_subnet_id_1, data.terraform_remote_state.network.outputs.dev_db_subnet_id_2]

  #[data.terraform_remote_state.network.outputs.dev_db_subnet_id]
  #data.data-block-name.local-name.outputs.root-module-output-name
  #vpc_id = data.terraform_remote_state.vpc.outputs.root-vpc-id

  tags = {
    Name        = "dev_db_sub_group"
    environment = "dev"
    created-by  = "terraform"
  }
}


# db module
module "dev_db" {
  source = "./../../../modules/database/rds_module"

  # rds_db variables
  identifier               = var.dev_db_identifier
  engine                   = var.dev_db_engine
  db_name                  = var.dev_db_db_name
  username                 = var.dev_db_username
  password                 = var.dev_db_password
  instance_class           = var.dev_db_instance_class
  allocated_storage        = var.dev_db_allocated_storage
  db_subnet_group_name     = aws_db_subnet_group.dev_db_sub_group.id
  multi_az                 = var.dev_db_multi_az
  vpc_security_group_ids   = [data.terraform_remote_state.network.outputs.root_module_dev_db_sg_id]
  availability_zone        = var.dev_db_availability_zone
  port                     = var.dev_db_port
  publicly_accessible      = var.dev_db_publicly_accessible
  skip_final_snapshot      = var.dev_db_skip_final_snapshot
  delete_automated_backups = var.dev_db_delete_automated_backups
}
