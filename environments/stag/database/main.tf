# DB Subnet Group creation
resource "aws_db_subnet_group" "stag_db_sub_group" {
  name        = "stag_db_sub_group"
  description = "stag_db_sub_group for rds server"
  subnet_ids  = [data.terraform_remote_state.network.outputs.stag_db_subnet_id_1, data.terraform_remote_state.network.outputs.stag_db_subnet_id_2]

  #[data.terraform_remote_state.network.outputs.dev_db_subnet_id]
  #data.data-block-name.local-name.outputs.root-module-output-name
  #vpc_id = data.terraform_remote_state.vpc.outputs.root-vpc-id

  tags = {
    Name        = "stag_db_sub_group"
    environment = "stag"
    created-by  = "terraform"
  }
}


# db module
module "stag_db" {
  source = "./../../../modules/database/rds_module"

  # rds_db variables
  identifier               = var.stag_db_identifier
  engine                   = var.stag_db_engine
  db_name                  = var.stag_db_db_name
  username                 = var.stag_db_username
  password                 = var.stag_db_password
  instance_class           = var.stag_db_instance_class
  allocated_storage        = var.stag_db_allocated_storage
  db_subnet_group_name     = aws_db_subnet_group.stag_db_sub_group.id
  multi_az                 = var.stag_db_multi_az
  vpc_security_group_ids   = [data.terraform_remote_state.network.outputs.root_module_stag_db_sg_id]
  availability_zone        = var.stag_db_availability_zone
  port                     = var.stag_db_port
  publicly_accessible      = var.stag_db_publicly_accessible
  skip_final_snapshot      = var.stag_db_skip_final_snapshot
  delete_automated_backups = var.stag_db_delete_automated_backups
}
