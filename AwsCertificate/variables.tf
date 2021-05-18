variable "aws_region" {
  type        = string
  description = "The AWS Region to deploy resources"
}

variable "environment" {
  type        = string
  description = "The deployment environment"
}

variable "parent_domain_suffix" {
  type        = string
  description = "The parent domain suffix for the certificate"
}

variable "parent_api_zone_id" {
  type        = string
  description = "The parent domain zone id"
}

variable "domain_prefix" {
  type        = string
  description = "The prefix for the domain"
}

variable "api_alb_zone_id" {
  type        = string
  description = "The ALB zone id"
}

variable "api_alb_dns_name" {
  type        = string
  description = "The ALB DNS Name"
}

variable "api_alb_arn" {
  type        = string
  description = "The ALB ARN"
}

variable "api_fargate_lb_target_group_arn" {
  type        = string
  description = "The ALB target group ARN"
}