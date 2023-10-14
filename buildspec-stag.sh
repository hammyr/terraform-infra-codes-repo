#!/bin/bash 

set -x  # debug mode
set -e  # exit the script when there is an error
set -o pipefail 
#set -exo pipefail       #same work as all above.


############  'network' infra creation in stag environment    ################
cd terraform-infra-codes-repo/environments/stag/network/
terraform --version
terraform init -input=false -backend-config=stag-network.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
#terraform destroy -input=false -auto-approve


############  'database' infra creation in stag environment    ################
cd terraform-infra-codes-repo/environments/stag/database/
terraform --version
terraform init -input=false -backend-config=stag-database.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
#terraform destroy -input=false -auto-approve



############  'compute' infra creation in stag environment    ################
cd terraform-infra-codes-repo/environments/stag/compute/
terraform --version
terraform init -input=false -backend-config=stag-compute.conf
terraform validate
terraform plan -lock=false -input=false
terraform apply -input=false -auto-approve
#terraform destroy -input=false -auto-approve


