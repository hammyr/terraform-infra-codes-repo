# Generic variables
region = "ap-southeast-1"


# bastion_instances variables
bastion_key_name = "win-11-singapore-key"
bastion_tags = {
  Name        = "dev_bastion_server"
  environment = "dev"
  created-by  = "terraform"
}

# app_1 & app_2 variables
app_key_name = "win-11-singapore-key"
app_1_tags = {
  Name        = "dev_app_1_server"
  environment = "dev"
  created-by  = "terraform"
}
app_2_tags = {
  Name        = "dev_app_2_server"
  environment = "dev"
  created-by  = "terraform"
}
# target_group & alb variables
target_group_name  = "dev-pr8-target-group"
alb_name           = "dev-pr8-alb"
load_balancer_type = "application"

