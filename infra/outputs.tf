output "access_key_id" {
  value = aws_iam_access_key.pipeline-handler-key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.pipeline-handler-key.secret
  sensitive = true
}