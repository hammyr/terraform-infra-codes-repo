# db instance
resource "aws_db_instance" "db_instance" {
  identifier = var.identifier
  engine = var.engine
  db_name = var.db_name
  username = var.username
  password = var.password
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  db_subnet_group_name = var.db_subnet_group_name
  multi_az = var.multi_az
  #vpc_security_group_ids = var.vpc_security_group_ids
  vpc_security_group_ids = var.vpc_security_group_ids
  availability_zone = var.availability_zone
  port = var.port
  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot
  delete_automated_backups = var.delete_automated_backups
}
