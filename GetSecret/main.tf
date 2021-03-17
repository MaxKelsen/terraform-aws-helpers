data "aws_secretsmanager_secret" "get" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "get" {
  secret_id = data.aws_secretsmanager_secret.get.id
}

output "get_secret" {
  value = data.aws_secretsmanager_secret_version.get.secret_string
}

output "get_secret_jsondecode" {
  value = jsondecode(data.aws_secretsmanager_secret_version.get.secret_string)
}


