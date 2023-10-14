# public-ip of bastion-server
output "child_bastion-server-public-ip" {
  value = aws_instance.wp-bastion-server.public_ip
}

# private-ip of app-server-1
output "child_app-server-1-private-ip" {
  value = aws_instance.wp-app-server-1.private_ip
}

# private-ip of app-server-2
output "child_app-server-2-private-ip" {
  value = aws_instance.wp-app-server-2.private_ip
}

# ALB dns_name
output "child_alb_dns_name" {
  value = aws_lb.wp_alb.dns_name
}

