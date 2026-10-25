# security-group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_vpc_security_group_rules_exclusive.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_rules_exclusive) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the security group. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the security group will be created. | `string` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | Determines whether to create the security group and all its rules. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the security group. | `string` | `"Managed by Terraform"` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | Map of egress rules to apply to the security group. | <pre>map(object({<br>    description                  = optional(string)<br>    from_port                    = optional(number)<br>    to_port                      = optional(number)<br>    ip_protocol                  = optional(string, "tcp")<br>    cidr_ipv4                    = optional(string)<br>    cidr_ipv6                    = optional(string)<br>    prefix_list_id               = optional(string)<br>    referenced_security_group_id = optional(string)<br>    tags                         = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| <a name="input_enable_exclusive_rules"></a> [enable\_exclusive\_rules](#input\_enable\_exclusive\_rules) | If true, strictly enforce only Terraform-managed rules on this security group. | `bool` | `true` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Map of ingress rules to apply to the security group. | <pre>map(object({<br>    description                  = optional(string)<br>    from_port                    = optional(number)<br>    to_port                      = optional(number)<br>    ip_protocol                  = optional(string, "tcp")<br>    cidr_ipv4                    = optional(string)<br>    cidr_ipv6                    = optional(string)<br>    prefix_list_id               = optional(string)<br>    referenced_security_group_id = optional(string)<br>    tags                         = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to assign to the security group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | The ARN of the security group. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group. |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the security group. |
| <a name="output_security_group_owner_id"></a> [security\_group\_owner\_id](#output\_security\_group\_owner\_id) | The owner ID of the security group. |
| <a name="output_security_group_vpc_id"></a> [security\_group\_vpc\_id](#output\_security\_group\_vpc\_id) | The VPC ID where the security group was created. |
<!-- END_TF_DOCS -->
