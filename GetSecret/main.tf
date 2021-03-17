data "aws_secretsmanager_secret" "get" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "get" {
  secret_id = data.aws_secretsmanager_secret.get.id
}
