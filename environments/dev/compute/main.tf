# Local variables
locals {
  root_user_data = <<-EOT
#!/bin/bash -xe

# System Updates
sudo yum -y update

# STEP 1 - Install system software - including Web and DB
sudo yum install -y mariadb-server httpd
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

# STEP 2 - Web and DB Servers Online - and set to startup
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

# STEP 3 - Setpassword & DB Variables
DBName='HR_RDS_DB'
DBUser='admin'
DBPassword='Project8'
DBRootPassword='Admin123root'
DBEndpoint='${data.terraform_remote_state.db.outputs.dev_db_endpoint}'
# STEP 4 - Set Mariadb Root Password
mysqladmin -u root password $DBRootPassword

# STEP 5 - Install Wordpress
sudo wget http://wordpress.org/latest.tar.gz -P /var/www/html
cd /var/www/html
sudo tar -zxvf latest.tar.gz
sudo cp -rvf wordpress/* .
sudo rm -R wordpress
sudo rm latest.tar.gz

# STEP 6 - Configure Wordpress
sudo cp ./wp-config-sample.php ./wp-config.php
sudo sed -i "s/'database_name_here'/'$DBName'/g" wp-config.php
sudo sed -i "s/'username_here'/'$DBUser'/g" wp-config.php
sudo sed -i "s/'password_here'/'$DBPassword'/g" wp-config.php
sudo sed -i "s/'localhost'/'$DBEndpoint'/g" wp-config.php

# Step 6a - permissions 
sudo usermod -a -G apache ec2-user    #Add your user (in this case, ec2-user) to the apache group. 
sudo chown -R ec2-user:apache /var/www    #Change the group ownership of /var/www and its contents to the apache group.
sudo chmod 2775 /var/www
sudo find /var/www -type d -exec chmod 2775 {} \;
sudo find /var/www -type f -exec chmod 0664 {} \;

# STEP 7 Create Wordpress DB
echo "CREATE DATABASE $DBName;" >> /tmp/db.setup
echo "CREATE USER '$DBUser'@'localhost' IDENTIFIED BY '$DBPassword';" >> /tmp/db.setup
echo "GRANT ALL ON $DBName.* TO '$DBUser'@'localhost';" >> /tmp/db.setup
echo "FLUSH PRIVILEGES;" >> /tmp/db.setup
mysql -u root --password=$DBRootPassword < /tmp/db.setup
sudo rm /tmp/db.setup
EOT
}


# compute module
module "compute" {
  source = "../../../modules/compute/ec2_module"

  # bastion_instances variables
  bastion_key_name               = var.bastion_key_name
  bastion_subnet_id              = data.terraform_remote_state.network.outputs.dev_public_subnet_1_id
  bastion_vpc_security_group_ids = [data.terraform_remote_state.network.outputs.root_module_dev_bastion_sg_id]
  bastion_tags                   = var.bastion_tags

  # app_1 & app_2 variables
  app_key_name               = var.app_key_name
  app_vpc_security_group_ids = [data.terraform_remote_state.network.outputs.root_module_dev_app_sg_id]
  user_data                  = local.root_user_data
  app_1_subnet_id            = data.terraform_remote_state.network.outputs.dev_private_subnet_1_id
  app_1_tags                 = var.app_1_tags
  app_2_subnet_id            = data.terraform_remote_state.network.outputs.dev_private_subnet_2_id
  app_2_tags                 = var.app_2_tags

  # target_group & alb variables
  target_group_name  = var.target_group_name
  vpc_id             = data.terraform_remote_state.network.outputs.dev_vpc_id
  alb_name           = var.alb_name
  load_balancer_type = var.load_balancer_type
  alb_subnets        = [data.terraform_remote_state.network.outputs.dev_public_subnet_1_id, data.terraform_remote_state.network.outputs.dev_public_subnet_2_id]
  alb_sg             = [data.terraform_remote_state.network.outputs.root_module_dev_alb_sg_id]

}
