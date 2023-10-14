#!/bin/bash 

#Noted: make one shell-script-file & copy this whole shell-script-file into newly created shell-file then run that shell-file.


set -x  # debug mode
set -e  # exit the script when there is an error
set -o pipefail 
#set -exo pipefail       #same work as all above.



############  'compute' infra creation in dev environment    ################
echo "======compute infra creation in dev environment is started=========="
cd /home/ubuntu/terraform-infra-codes-repo/environments/dev/compute/
terraform --version
terraform init -input=false -backend-config=dev-compute.conf
terraform validate
terraform plan -lock=false -input=false
terraform destroy -input=false -auto-approve
echo "======compute infra creation in dev environment is completed=========="



############  'database' infra creation in dev environment    ################
echo "======database infra creation in dev environment is started=========="
cd /home/ubuntu/terraform-infra-codes-repo/environments/dev/database/
terraform --version
terraform init -input=false -backend-config=dev-database.conf
terraform validate
terraform plan -lock=false -input=false
terraform destroy -input=false -auto-approve
echo "======database infra creation in dev environment is completed=========="



############  'network' infra creation in dev environment    ################
echo "======network infra creation in dev environment is started=========="
cd /home/ubuntu/terraform-infra-codes-repo/environments/dev/network/
terraform --version
terraform init -input=false -backend-config=dev-network.conf
terraform validate
terraform plan -lock=false -input=false
terraform destroy -input=false -auto-approve
echo "======network infra creation in dev environment is completed=========="

