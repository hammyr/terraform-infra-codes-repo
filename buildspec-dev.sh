#!/bin/bash 

set -x  # debug mode
set -e  # exit the script when there is an error
set -o pipefail 
#set -exo pipefail       #same work as all above.


############  'network' infra creation in dev environment    ################
cd terraform-infra-codes-repo/environments/dev/network/
terraform --version
terraform init -input=false -backend-config=dev-network.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
#terraform destroy -input=false -auto-approve


############  'database' infra creation in dev environment    ################
cd terraform-infra-codes-repo/environments/dev/database/
terraform --version
terraform init -input=false -backend-config=dev-database.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
#terraform destroy -input=false -auto-approve



############  'compute' infra creation in dev environment    ################
cd terraform-infra-codes-repo/environments/dev/compute/
terraform --version
terraform init -input=false -backend-config=dev-compute.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
#terraform destroy -input=false -auto-approve


