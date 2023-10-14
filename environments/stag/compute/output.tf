# public-ip of bastion-server
output "root_bastion-server-public-ip" {
  value = module.compute.child_bastion-server-public-ip
}

# private-ip of app-server-1
output "root_app-server-1-private-ip" {
  value = module.compute.child_app-server-1-private-ip
}

# private-ip of app-server-2
output "root_app-server-2-private-ip" {
  value = module.compute.child_app-server-2-private-ip
}

# ALB dns_name
output "root_alb_dns_name" {
  value = module.compute.child_alb_dns_name
}

