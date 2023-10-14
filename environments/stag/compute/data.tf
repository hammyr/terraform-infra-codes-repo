# data block for vpc for terraform_remote_state
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "hr-tf-admin-terraform-state-01"
    key    = "stag/network/terraform.tfstate"
    region = "ap-southeast-1"
  }
}


# data block for db for terraform_remote_state
data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "hr-tf-admin-terraform-state-01"
    key    = "stag/database/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

