# ☁️ AWS Terraform Modules Store

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D_1.5.0-623CE4.svg?logo=terraform)](https://www.terraform.io/)
[![AWS Provider](https://img.shields.io/badge/AWS_Provider-%3E%3D_6.0-FF9900.svg?logo=amazon-aws)](https://registry.terraform.io/providers/hashicorp/aws/latest)
[![PR Checks](https://github.com/itspuru21/terraform-modules-store/actions/workflows/pr-checks.yml/badge.svg)](https://github.com/itspuru21/terraform-modules-store/actions)

An enterprise-grade Infrastructure as Code (IaC) monorepo containing highly reusable, documented, and locally tested AWS Terraform modules. Built to support a 30-day architecture challenge and demonstrate scalable DevOps practices.

## 🏗️ Repository Architecture

This monorepo strictly separates reusable module logic from executable environments and tests.

```text
.
├── .github/workflows/      # CI/CD pipelines (Branch protection, Pre-commit checks)
├── modules/                # Core reusable Terraform modules
│   └── aws/
│       ├── iam-role/       # Dynamic IAM role generation and policy attachment
│       └── s3-bucket/      # Secure S3 bucket provisioning
├── scripts/                # Custom Python automation scripts
├── .pre-commit-config.yaml # Local git hook configurations
└── .terraform-docs.yml     # Centralized markdown templating engine
```

## 🤖 CI/CD & Automation

Code quality and documentation are strictly enforced via GitHub Actions and local `pre-commit` hooks. Every Pull Request must pass the following checks before merging into `main`:

*   **Terraform Fmt:** Enforces canonical HCL formatting.
*   **Terraform Validate:** Verifies syntax and internal consistency of all modules.
*   **TFLint:** Static analysis to catch provider-specific errors (configured for AWS) and enforce industry best practices.
*   **Terraform-Docs:** Automatically injects inputs, outputs, and version requirements into each module's `README.md` based on a custom Go template.
*   **Branch Protection:** Direct commits to `main` are blocked. Squash-and-merge strategies are enforced.

## 📦 Available Modules

| Module | Description | Status |
|--------|-------------|--------|
| [IAM Role](./modules/aws/iam-role) | Provisions an IAM role with dynamic JSON trust policies and managed policy attachments. | ✅ Active |
| [S3 Bucket](./modules/aws/s3-bucket) | Provisions a standard Amazon S3 bucket with customizable tagging. | ✅ Active |

## 🚀 Usage

To consume a module from this repository in your own Terraform root modules, reference the GitHub repository URL and specify the exact module path using the `//` separator:

```hcl
module "s3_bucket" {
  source      = "github.com/itspuru21/terraform-modules-store//modules/aws/s3-bucket"
  bucket_name = "my-unique-bucket-name"
}
```


## 👨‍💻 Author
**Purushottam Garad**
*Cloud & DevOps Engineer*

## 🤝 Acknowledgments

This repository's automation and code quality standards are built on the shoulders of several excellent open-source projects:

*   **[pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)** by Anton Babenko - Provides the core git hook collection for Terraform.
*   **[terraform-docs](https://terraform-docs.io/)** - Powers the automated markdown documentation and custom Go-templating.
*   **[tflint](https://github.com/terraform-linters/tflint)** - Provides the robust static analysis and AWS-specific ruleset.
*   **[pre-commit](https://pre-commit.com/)** - The underlying framework managing the local git hooks.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
