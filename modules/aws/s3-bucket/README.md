# AWS S3 Bucket Module

[![Terraform Version](https://img.shields.io/badge/Terraform-%3E%3D_1.5.0-623CE4.svg?logo=terraform)](https://www.terraform.io/)
[![AWS Provider](https://img.shields.io/badge/AWS_Provider-%3E%3D_6.0-FF9900.svg?logo=amazon-aws)](https://registry.terraform.io/providers/hashicorp/aws/latest)
[![PR Checks](https://github.com/itspuru21/terraform-modules-store/actions/workflows/pr-checks.yml/badge.svg)](https://github.com/itspuru21/terraform-modules-store/actions)

This module provisions a secure, standard Amazon S3 bucket.

## Usage

```hcl
module "s3_bucket" {
  source      = "github.com/itspuru21/terraform-modules-store//modules/aws/s3-bucket"
  bucket_name = "my-unique-bucket-name"

  tags = {
    Environment = "Production"
  }
}
```

> [!IMPORTANT]
> **Understanding Terraform Module Sourcing**
>
> Using the double forward slash (`//`) in the `source` URL is critical. It explicitly tells Terraform which module subdirectory to execute from the downloaded repository during the `init` phase. As showed in the above Usage example.
>
> By default, Terraform relies on standard Git mechanisms to fetch the module code. Because Git must clone the entire repository tree, there is currently no way to configure the root module to download only a specific subfolder.
>
> However, there is no need to worry about storage bloat. Even a monorepo containing over 500 modules will barely reach 50 MB, as HCL files are simply lightweight, plain-text code.

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
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket. Must be globally unique. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the bucket. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the bucket. |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The name of the bucket. |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
