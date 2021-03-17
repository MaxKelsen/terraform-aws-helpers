data "aws_secretsmanager_secret" "role" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "role" {
  secret_id = data.aws_secretsmanager_secret.role.id
}

output "role_access_key" {
  value = jsondecode(data.aws_secretsmanager_secret_version.role.secret_string)["AccessKey"]
}

output "role_secret_access_key" {
  value = jsondecode(data.aws_secretsmanager_secret_version.role.secret_string)["SecretAccessKey"]
}
