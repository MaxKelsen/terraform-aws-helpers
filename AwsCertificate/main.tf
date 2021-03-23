resource "aws_lb_listener" "api_alb_listener" {
  load_balancer_arn = var.api_alb_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.api_alb_domain_cert.arn
  default_action {
    target_group_arn = var.api_fargate_lb_target_group_arn
    type             = "forward"
  }
}

### route 53
resource "aws_route53_record" "api_alb_a_record" {
  zone_id = var.parent_api_zone_id
  name    = format("%s.%s.%s", var.domain_prefix, var.environment, var.parent_domain_suffix)
  type    = "A"
  alias {
    evaluate_target_health = false
    name = var.api_alb_dns_name
    zone_id = var.api_alb_zone_id
  }
}

resource "aws_acm_certificate" "api_alb_domain_cert" {
  depends_on        = [aws_route53_record.api_alb_a_record]
  domain_name       = format("%s.%s.%s", var.domain_prefix, var.environment, var.parent_domain_suffix)
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "api_alb_custom_cert_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.api_alb_domain_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.parent_api_zone_id
}

resource "aws_acm_certificate_validation" "api_alb_cert_validation" {
  certificate_arn         = aws_acm_certificate.api_alb_domain_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.api_alb_custom_cert_validation_record : record.fqdn]
}