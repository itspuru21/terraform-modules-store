module "test_bucket" {
  source = "../../"

  bucket_name = "my-portfolio-test-bucket-12345" # globally unique
  tags = {
    Environment = "Test"
    Project     = "Terraform-Modules-Store"
    Module      = "S3-Bucket"
  }
}

output "test_bucket_arn" {
  value = module.test_bucket.bucket_arn
}
