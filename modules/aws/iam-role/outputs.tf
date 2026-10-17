output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_role.this.arn
}

output "role_name" {
  description = "The name of the IAM role."
  value       = aws_iam_role.this.name
}
