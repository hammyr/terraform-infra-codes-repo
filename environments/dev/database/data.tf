# data block for terraform_remote_state
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "hr-tf-admin-terraform-state-01"
    key    = "dev/network/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
