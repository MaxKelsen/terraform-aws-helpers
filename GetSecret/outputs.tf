output "get_secret" {
  value = data.aws_secretsmanager_secret_version.get.secret_string
  description = "A raw dump - probably JSON string encoded of the whole secret"
}

output "get_secret_jsondecode" {
  value = jsondecode(data.aws_secretsmanager_secret_version.get.secret_string)
  description = "JSON decoded whole secret"
}
