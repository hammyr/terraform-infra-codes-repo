# ===========================================
[ec2-user@ip-172-31-3-203 ~]$ tree terraform-infra-codes-repo/
terraform-infra-codes-repo/
├── buildspec-dev.sh
├── buildspec-dev.yml
├── buildspec-stag.sh
├── buildspec-stag.yml
├── environments
│   ├── dev
│   │   ├── compute
│   │   │   ├── data.tf
│   │   │   ├── dev-compute.conf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── database
│   │   │   ├── data.tf
│   │   │   ├── dev-database.conf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── network
│   │   │   ├── data.tf
│   │   │   ├── dev-network.conf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── storage
│   │       ├── data.tf
│   │       ├── dev-storage.conf
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── terraform.tfvars
│   │       ├── variables.tf
│   │       └── version.tf
│   ├── prod
│   │   ├── compute
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── prod-compute.conf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── database
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── prod-database.conf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── network
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── prod-network.conf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── storage
│   │       ├── data.tf
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── prod-storage.conf
│   │       ├── terraform.tfvars
│   │       ├── variables.tf
│   │       └── version.tf
│   └── stag
│       ├── compute
│       │   ├── data.tf
│       │   ├── main.tf
│       │   ├── output.tf
│       │   ├── stag-compute.conf
│       │   ├── terraform.tfvars
│       │   ├── variables.tf
│       │   └── version.tf
│       ├── database
│       │   ├── data.tf
│       │   ├── main.tf
│       │   ├── output.tf
│       │   ├── stag-database.conf
│       │   ├── terraform.tfvars
│       │   ├── variables.tf
│       │   └── version.tf
│       ├── network
│       │   ├── data.tf
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── stag-network.conf
│       │   ├── terraform.tfvars
│       │   ├── variables.tf
│       │   └── versions.tf
│       └── storage
│           ├── data.tf
│           ├── main.tf
│           ├── output.tf
│           ├── stag-storage.conf
│           ├── terraform.tfvars
│           ├── variables.tf
│           └── version.tf
├── LICENSE
├── modules
│   ├── compute
│   │   └── ec2_module
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── README.txt
│   │       └── variables.tf
│   ├── database
│   │   └── rds_module
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── variables.tf
│   ├── network
│   │   ├── security_group_module
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpc_module
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── storage
│       └── s3_module
│           ├── main.tf
│           ├── output.tf
│           └── variables.tf
├── prerequisite-resources
│   ├── main.tf
│   └── README.txt
└── README.md

27 directories, 108 files


# =============================================


# terraform GitHub repo for terraform modules:
- here we have complete `child_module` for vpc, security_group, database, ec2-instance.
- here we have complete `root_module` for all above resources.



### Noted:
- yha pura project aws codepipeline k through bhi deploy ho skta hai wo bhi step-by-step yani 
	- pehle `dev' me then same infra in `stag` me,
	- yha hmne build script `buildspec-dev.yml` for codepipeline k liye banaya hai
	- yani kalyan reddy wale se pipeline bnao aur iss repo ko integrate kro thats it.
- yha hmne `project-08` ko complete kiya hai yha byusing terraform modules concept like real time.
- yha hmne complete project ko 2 env(dev & stag) me complete create kiya hai.
- yha hmne 3 category like (network, db, compute) ka complete resources create kiya hai in `dev' & `stag' env me.
- yha storage category ko skip kiya hai, but pura process samajh liya hai, so no need to create.



### Terraform github repo file structure including `child_module` & `root_module` terraform scripts:
- here inside repo folder we have these folders:
	- `environments` folder for `root_module` terraform codes.
	- `modules` folder for `child_module` terraform codes.
	- `prerequisite-resources` folder for terraform codes for `S3 bucket` for backend & `dynamodb table` for locking statefile.
	- `buildspec-dev.yml` script for `AWS CodeBuild` for build process in `dev environment`.
	- `buildspec-stag.yml` script for `AWS CodeBuild` for build process in `stag environment`.
	- `buildspec-dev.sh` script for manually run terraform script for provision infra in `dev environment`.
	- `buildspec-stag.sh` script for manually run terraform script for provision infra in `stag environment`.
	- `.gitignore` file for ignore imp statefile & all.
	- `LICENSE` file for common license.
	- `README.md` for our guidance.
```
/*
-Noted:  here we have created file structure for 3 environments(dev, stag, prod) but we have wriiten
terraform script for only 2 environments(dev & stag) bcuz of billing, but infra is same so you
can understand  whole process.
*/


[ec2-user@ip-172-31-3-203 ~]$ tree terraform-infra-codes-repo/
terraform-infra-codes-repo/
├── buildspec-dev.sh
├── buildspec-dev.yml
├── buildspec-stag.sh
├── buildspec-stag.yml
├── environments
│   ├── dev
│   │   ├── compute
│   │   │   ├── data.tf
│   │   │   ├── dev-compute.conf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── database
│   │   │   ├── data.tf
│   │   │   ├── dev-database.conf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── network
│   │   │   ├── data.tf
│   │   │   ├── dev-network.conf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── storage
│   │       ├── data.tf
│   │       ├── dev-storage.conf
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── terraform.tfvars
│   │       ├── variables.tf
│   │       └── version.tf
│   ├── prod
│   │   ├── compute
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── prod-compute.conf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── database
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── prod-database.conf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── version.tf
│   │   ├── network
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── prod-network.conf
│   │   │   ├── terraform.tfvars
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   └── storage
│   │       ├── data.tf
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── prod-storage.conf
│   │       ├── terraform.tfvars
│   │       ├── variables.tf
│   │       └── version.tf
│   └── stag
│       ├── compute
│       │   ├── data.tf
│       │   ├── main.tf
│       │   ├── output.tf
│       │   ├── stag-compute.conf
│       │   ├── terraform.tfvars
│       │   ├── variables.tf
│       │   └── version.tf
│       ├── database
│       │   ├── data.tf
│       │   ├── main.tf
│       │   ├── output.tf
│       │   ├── stag-database.conf
│       │   ├── terraform.tfvars
│       │   ├── variables.tf
│       │   └── version.tf
│       ├── network
│       │   ├── data.tf
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── stag-network.conf
│       │   ├── terraform.tfvars
│       │   ├── variables.tf
│       │   └── versions.tf
│       └── storage
│           ├── data.tf
│           ├── main.tf
│           ├── output.tf
│           ├── stag-storage.conf
│           ├── terraform.tfvars
│           ├── variables.tf
│           └── version.tf
├── LICENSE
├── modules
│   ├── compute
│   │   └── ec2_module
│   │       ├── main.tf
│   │       ├── output.tf
│   │       ├── README.txt
│   │       └── variables.tf
│   ├── database
│   │   └── rds_module
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── variables.tf
│   ├── network
│   │   ├── security_group_module
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpc_module
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── storage
│       └── s3_module
│           ├── main.tf
│           ├── output.tf
│           └── variables.tf
├── prerequisite-resources
│   ├── main.tf
│   └── README.txt
└── README.md

27 directories, 108 files

```



### S3 bucket and folder structure for `terraform.tfstate` file for all `environments`:
- for `dev` environment we have 4 `terraform.tfstate` file.
- for `stag` environment we have 4 `terraform.tfstate` file.
- for `prod` environment we have 4 `terraform.tfstate` file.
- see below all stattefile structure:
```
[ec2-user@ip-172-31-3-203 ~]$ tree hr-tf-admin-terraform-state-01/
hr-tf-admin-terraform-state-01/
├── dev
│   ├── compute
│   │   └── terraform.tfstate
│   ├── database
│   │   └── terraform.tfstate
│   ├── network
│   │   └── terraform.tfstate
│   └── storage
│       └── terraform.tfstate
├── prod
│   ├── compute
│   │   └── terraform.tfstate
│   ├── database
│   │   └── terraform.tfstate
│   ├── network
│   │   └── terraform.tfstate
│   └── storage
│       └── terraform.tfstate
└── stag
    ├── compute
    │   └── terraform.tfstate
    ├── database
    │   └── terraform.tfstate
    ├── network
    │   └── terraform.tfstate
    └── storage
        └── terraform.tfstate

15 directories, 12 files

```





### How to write `output blocks` in root modules:
- output blocks in child modules: `simple as we define`
- output blocks in root modules: `module.<root-module-block-name>.<child-module-output-block-name>`
```
# output blocks in child modules (simple as we define)
output "child_module_public_subnet_1" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnet_1.id
}

output "child_module_security_group_ids" {
  description = "security_group_ids"
  value = aws_security_group.security_group.id 
}


# output blocks in root modules
output "root_module_public_subnet_1_id" {
  description = "List of IDs of public subnets"
  value       = module.network.child_module_public_subnet_1
}

output "root_module_dev_bastion_sg_id" {
  description = "dev_bastion_sg_id"
  value       = module.all_sg.child_module_security_group_ids
}
```



### how to fetch attributes ids, etc from `terraform_remote_state`
- we have to define data block for `terraform_remote_state` to fetch attributes details.
- 
```
# data block for vpc for terraform_remote_state
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "hr-tf-admin-terraform-state-01"
    key    = "dev/network/terraform.tfstate"
    region = "ap-southeast-1"
  }
}


# compute module
module "compute" {
  source = "../../../modules/compute/ec2_module"

  # bastion_instances variables
  bastion_key_name               = var.bastion_key_name
  bastion_subnet_id              = data.terraform_remote_state.network.outputs.root_module_public_subnet_1_id
  bastion_vpc_security_group_ids = [data.terraform_remote_state.network.outputs.root_module_dev_bastion_sg_id]
  bastion_tags                   = var.bastion_tags
}
```



### when we have multiple `root modules block` within same `*.tf` file or another `*.tf` files then how to fetch attribute from one `root module block` to `another root module block`, see:
- here we have one `root modules block` for `vpc` & another `root modules block` for `security_group`.
- here we need to pass attribute `vpc_id` from `network` module block to `all_sg` module block.
- Noted: module is an object so module dont have any attribute, so for that we have to define output block in child module.

```
# Network Module
module "network" {
  source = "./../../../modules/network/vpc_module"

  # vpc variables
  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_tags             = var.vpc_tags
 }


# all_sg Module
module "all_sg" {
  source = "./../../../modules/network/security_group_module"

  # security_group variables
  vpc_id = module.network.vpc_id 		#here 'vpc_id' is name of output block from child module.
  /*Noted: here 'vpc_id' is name of output block in child module.
    module ek object hai so module ka koi 'attribute' ni hota hai jaise baki 
    resource block like 'aws_instance', 'aws_vpc', etc  ka hota hai aur terraform
    documentation me bhi define rhta hai, so overall child module k output block
    ka jo name hai vhi apka 'attribute' hoga.
    */
}
```



### main shell script to create all env infra at once
- infra-creation.sh
```
#!/bin/bash

set -x  # debug mode
set -e  # exit the script when there is an error
set -o pipefail 
#set -exo pipefail       #same work as all above.


# install terraform & configure in ubuntu20.04



```

