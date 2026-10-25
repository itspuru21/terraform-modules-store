terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "sg-test-vpc"
  }
}

module "web_sg" {
  source = "../../"

  name                   = "test-web-sg"
  description            = "Test security group for web servers"
  vpc_id                 = aws_vpc.test.id
  enable_exclusive_rules = true

  ingress_rules = {
    http = {
      description = "Allow HTTP inbound"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
    https = {
      description = "Allow HTTPS inbound"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  egress_rules = {
    all_outbound = {
      description = "Allow all outbound traffic"
      from_port   = -1
      to_port     = -1
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  tags = {
    Environment = "Test"
  }
}


output "id" {
  value = module.web_sg.security_group_id
}

output "arn" {
  value = module.web_sg.security_group_arn
}

output "name" {
  value = module.web_sg.security_group_name
}

output "owner_id" {
  value = module.web_sg.security_group_owner_id
}

output "vpc_id" {
  value = module.web_sg.security_group_vpc_id
}
