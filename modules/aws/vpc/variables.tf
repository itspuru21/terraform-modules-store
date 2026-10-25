variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "cidr_block" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}



variable "azs" {
  description = "A list of availability zones in the region."
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks inside the VPC."
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnet CIDR blocks inside the VPC."
  type        = list(string)
  default     = []
}
