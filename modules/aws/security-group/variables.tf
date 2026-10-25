################################################################################
# Security Group Configuration
################################################################################
variable "create" {
  description = "Determines whether to create the security group and all its rules."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the security group."
  type        = string
}

variable "description" {
  description = "Description of the security group."
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created."
  type        = string
}

variable "tags" {
  description = "Tags to assign to the security group."
  type        = map(string)
  default     = {}
}

################################################################################
# Ingress (Inbound) Rules
################################################################################
variable "ingress_rules" {
  description = "Map of ingress rules to apply to the security group."
  type = map(object({
    description                  = optional(string)
    from_port                    = optional(number)
    to_port                      = optional(number)
    ip_protocol                  = optional(string, "tcp")
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string), {})
  }))
  default = {}
}

################################################################################
# Egress (Outbound) Rules
################################################################################
variable "egress_rules" {
  description = "Map of egress rules to apply to the security group."
  type = map(object({
    description                  = optional(string)
    from_port                    = optional(number)
    to_port                      = optional(number)
    ip_protocol                  = optional(string, "tcp")
    cidr_ipv4                    = optional(string)
    cidr_ipv6                    = optional(string)
    prefix_list_id               = optional(string)
    referenced_security_group_id = optional(string)
    tags                         = optional(map(string), {})
  }))
  default = {}
}

################################################################################
# Exclusive Rules Enforcement
################################################################################
variable "enable_exclusive_rules" {
  description = "If true, strictly enforce only Terraform-managed rules on this security group."
  type        = bool
  default     = true
}
