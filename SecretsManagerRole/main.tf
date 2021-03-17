data "aws_secretsmanager_secret" "role" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "role" {
  secret_id = data.aws_secretsmanager_secret.role.id
}
