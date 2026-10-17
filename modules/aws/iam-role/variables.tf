variable "role_name" {
  description = "The name of the IAM role."
  type        = string
}

variable "assume_role_policy" {
  description = "The JSON formatted trust policy that grants an entity permission to assume the role."
  type        = string
}

variable "managed_policy_arns" {
  description = "A list of Amazon Resource Names (ARNs) of the IAM managed policies to attach to the role."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the IAM role."
  type        = map(string)
  default     = {}
}
