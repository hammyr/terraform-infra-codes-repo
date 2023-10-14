# Data source:  Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


# bastion-server in public-subnet-1
resource "aws_instance" "wp-bastion-server" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  #key_name                    = "wp-project"
  key_name = var.bastion_key_name
  #subnet_id                   = aws_subnet.wp-public-subnet-1.id
  subnet_id = var.bastion_subnet_id
  associate_public_ip_address = "true"
  #vpc_security_group_ids      = [aws_security_group.wp-bastion-sg.id]
  vpc_security_group_ids = var.bastion_vpc_security_group_ids
  tags = var.bastion_tags
  /*tags = {
    "Name" = "bastion-server"
  }*/
}


# two app-servers in private-subnets
resource "aws_instance" "wp-app-server-1" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  #key_name                    = "wp-project"
  key_name = var.app_key_name
  #subnet_id                   = aws_subnet.wp-private-subnet-1.id
  subnet_id = var.app_1_subnet_id
  associate_public_ip_address = "false"
  #vpc_security_group_ids      = [aws_security_group.wp-App-SG.id]
  vpc_security_group_ids = var.app_vpc_security_group_ids
  #user_data                   = base64encode(local.user_data)
  #user_data = null
  user_data     = var.user_data
  /*tags = {
    "Name" = "app-server-1"
  }*/
  tags = var.app_1_tags
}

resource "aws_instance" "wp-app-server-2" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  #key_name                    = "wp-project"
  key_name = var.app_key_name
  #subnet_id                   = aws_subnet.wp-private-subnet-2.id
  subnet_id = var.app_2_subnet_id
  associate_public_ip_address = "false"
  #vpc_security_group_ids      = [aws_security_group.wp-App-SG.id]
  vpc_security_group_ids = var.app_vpc_security_group_ids
  #user_data                   = base64encode(local.user_data)
  #user_data = null
  user_data     = var.user_data
  tags = var.app_2_tags
  
}


# target group
resource "aws_lb_target_group" "wp_tg" {
  target_type = "instance"
  #name        = "pr8-target-group"
  name = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  #vpc_id      = aws_vpc.wp_vpc.id
  vpc_id = var.vpc_id

  stickiness { #here no need to enabled this stickiness argument,#
    #enabled = true
    enabled         = false
    type            = "lb_cookie"
    cookie_duration = 3600
  }

  health_check {
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
  }

}

# aws_lb_target_group_attachment 
resource "aws_lb_target_group_attachment" "instances-attachment-1" {
  target_group_arn = aws_lb_target_group.wp_tg.arn
  target_id        = aws_instance.wp-app-server-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "instances-attachment-2" {
  target_group_arn = aws_lb_target_group.wp_tg.arn
  target_id        = aws_instance.wp-app-server-2.id
  port             = 80
}


# ALP
resource "aws_lb" "wp_alb" {
  #name                       = "pr8-alb"
  name                       = var.alb_name
  internal                   = false
  #load_balancer_type         = "application"
  load_balancer_type = var.load_balancer_type
  #subnets                    = [aws_subnet.wp-public-subnet-1.id, aws_subnet.wp-public-subnet-2.id]
  subnets = var.alb_subnets
  #security_groups            = [aws_security_group.wp-ALB-SG.id]
  security_groups = var.alb_sg
  enable_deletion_protection = false
  /* "enable_deletion_protection" If true, deletion of the load balancer will be disabled via 
  the AWS API. This will prevent Terraform from deleting the load balancer.*/
}


# Load Balancer Listener on port 80
resource "aws_lb_listener" "alb_forward_listener_80" {
  load_balancer_arn = aws_lb.wp_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wp_tg.arn
  }
}

