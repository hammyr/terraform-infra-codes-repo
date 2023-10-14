# Generic variables
region = "ap-southeast-1"


# bastion_instances variables
bastion_key_name = "win-11-singapore-key"
bastion_tags = {
  Name        = "stag_bastion_server"
  environment = "stag"
  created-by  = "terraform"
}

# app_1 & app_2 variables
app_key_name = "win-11-singapore-key"
app_1_tags = {
  Name        = "stag_app_1_server"
  environment = "stag"
  created-by  = "terraform"
}
app_2_tags = {
  Name        = "stag_app_2_server"
  environment = "stag"
  created-by  = "terraform"
}
# target_group & alb variables
target_group_name  = "stag-pr8-target-group"
alb_name           = "stag-pr8-alb"
load_balancer_type = "application"

