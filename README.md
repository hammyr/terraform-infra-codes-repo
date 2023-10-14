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
- here we have created file structure for 3 environments(dev, stag, prod) but we have wriiten terraform
- script for only 2 environments(dev & stag) bcuz of billing, but infra is same so you can understand  whole process.
- to be cont.........



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

