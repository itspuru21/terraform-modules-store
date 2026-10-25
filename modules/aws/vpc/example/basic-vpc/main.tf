module "test_vpc" {
  source = "../../"

  vpc_name             = "test-portfolio-vpc"
  cidr_block           = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b"]
  public_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets      = ["10.0.10.0/24", "10.0.20.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = "Test"
    ManagedBy   = "Terraform"
  }
}
