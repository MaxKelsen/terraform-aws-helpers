variable "aws_region" {
  type = string
  description = "A valid region where secrets manager holds the secrets."
}

variable "secret_name" {
  type = string
  description = "The specific secret name"
}
