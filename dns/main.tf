data "aws_route53_zone" "primary_domain" {
  count = "${var.existing}"
  name = "${var.domain_name}"
}

resource "aws_route53_zone" "primary_domain" {
  count = "${1 - var.existing}"
  name = "${var.domain_name}"
}

resource "aws_route53_record" "root_domain" {
  count = "${1 - var.existing}"
  zone_id = "${aws_route53_zone.primary_domain.zone_id}"
  name = "${var.domain_name}"
  type = "A"
  alias {
    name = "${var.alias_domain_name}"
    zone_id = "${var.alias_zone_id}"
    evaluate_target_health = "${var.alias_health_check}"
  }
}

resource "aws_route53_record" "sub_domain" {
  count = "${1 - var.existing}"
  zone_id = "${aws_route53_zone.primary_domain.zone_id}"
  name = "www.${var.domain_name}"
  type = "CNAME"
  ttl = "60"
  records = ["${var.domain_name}"]
}

resource "aws_route53_record" "root_domain" {
  count = "${var.existing}"
  zone_id = "${data.aws_route53_zone.primary_domain.zone_id}"
  name = "${var.domain_name}"
  type = "A"
  alias {
    name = "${var.alias_domain_name}"
    zone_id = "${var.alias_zone_id}"
    evaluate_target_health = "${var.alias_health_check}"
  }
}

resource "aws_route53_record" "sub_domain" {
  count = "${var.existing}"
  zone_id = "${data.aws_route53_zone.primary_domain.zone_id}"
  name = "www.${var.domain_name}"
  type = "CNAME"
  ttl = "60"
  records = ["${var.domain_name}"]
}