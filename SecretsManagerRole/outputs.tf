output "role_access_key" {
  description = "JSON decoded AWS Access Key"
  value = jsondecode(data.aws_secretsmanager_secret_version.role.secret_string)["AccessKey"]
}

output "role_secret_access_key" {
  description = "JSON decoded AWS Secret Access Key"
  value = jsondecode(data.aws_secretsmanager_secret_version.role.secret_string)["SecretAccessKey"]
}
