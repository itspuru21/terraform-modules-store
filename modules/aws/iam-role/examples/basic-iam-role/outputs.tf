output "deployed_role_arn" {
  description = "The ARN of the test role."
  value       = module.test_iam_role.role_arn
}
