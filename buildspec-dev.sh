#!/bin/bash 

#Noted: make one shell-script-file & copy this whole shell-script-file into newly created shell-file then run that shell-file.


set -x  # debug mode
set -e  # exit the script when there is an error
set -o pipefail 
#set -exo pipefail       #same work as all above.



# terraform install & configure in ubuntu-20.4
sudo apt update -y
sudo apt install -y unzip wget
sudo wget https://releases.hashicorp.com/terraform/1.5.7/terraform_1.5.7_linux_amd64.zip
sudo unzip terraform_1.5.7_linux_amd64.zip
sudo mv terraform /usr/local/bin
sudo rm -rf terraform_1.5.7_linux_amd64.zip
sudo terraform --version



# awscli configure
	#no need, bcuz we are using iam-role attach in this instance.
	#iam-role-name: AdministratorAccess-Role-for-infra-provisioning


# git install & clone repo from hammyr public repo:
sudo apt install git -y
sudo git --version
sudo git clone https://github.com/hammyr/terraform-infra-codes-repo.git




############  'network' infra creation in dev environment    ################
echo "======network infra creation in dev environment is started=========="
cd /home/ubuntu/terraform-infra-codes-repo/environments/dev/network/
terraform --version
terraform init -input=false -backend-config=dev-network.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
echo "======network infra creation in dev environment is completed=========="



############  'database' infra creation in dev environment    ################
echo "======database infra creation in dev environment is started=========="
cd /home/ubuntu/terraform-infra-codes-repo/environments/dev/database/
terraform --version
terraform init -input=false -backend-config=dev-database.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
echo "======database infra creation in dev environment is completed=========="



############  'compute' infra creation in dev environment    ################
echo "======compute infra creation in dev environment is started=========="
cd /home/ubuntu/terraform-infra-codes-repo/environments/dev/compute/
terraform --version
terraform init -input=false -backend-config=dev-compute.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
echo "======compute infra creation in dev environment is completed=========="

