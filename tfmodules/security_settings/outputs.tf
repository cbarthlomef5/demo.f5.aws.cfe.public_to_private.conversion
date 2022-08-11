output "windows_bastion_iam_policy" {
  value = aws_iam_policy.ec2_policy.id
}

output "bigip_pw_arn" {
  value = aws_secretsmanager_secret.bigip_pw_secret_id.arn
}