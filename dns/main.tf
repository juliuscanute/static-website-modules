data "aws_route53_zone" "primary_domain" {
  name = "${var.domain}"
}

resource "aws_route53_record" "root_domain" {
  zone_id = "${data.aws_route53_zone.primary_domain.zone_id}"
  name = "${var.domain}"
  type = "A"
  alias {
    name = "${var.alias_domain_name}"
    zone_id = "${var.alias_zone_id}"
    evaluate_target_health = "${var.alias_health_check}"
  }
}