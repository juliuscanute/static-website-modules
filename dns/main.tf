data "aws_route53_zone" "primary_domain_existent" {
  count = "${var.existing}"
  name = "${var.domain_name}"
}

resource "aws_route53_zone" "primary_domain_non_existent" {
  count = "${1 - var.existing}"
  name = "${var.domain_name}"
}

resource "aws_route53_record" "root_domain_non_existent" {
  count = "${1 - var.existing}"
  zone_id = "${aws_route53_zone.primary_domain_non_existent.zone_id}"
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
  zone_id = "${aws_route53_zone.primary_domain_non_existent.zone_id}"
  name = "www.${var.domain_name}"
  type = "CNAME"
  ttl = "60"
  records = ["${var.domain_name}"]
}

resource "aws_route53_record" "root_domain_existent" {
  count = "${var.existing}"
  zone_id = "${data.aws_route53_zone.primary_domain_existent.zone_id}"
  name = "${var.domain_name}"
  type = "A"
  alias {
    name = "${var.alias_domain_name}"
    zone_id = "${var.alias_zone_id}"
    evaluate_target_health = "${var.alias_health_check}"
  }
}

resource "aws_route53_record" "sub_domain_existent" {
  count = "${var.existing}"
  zone_id = "${data.aws_route53_zone.primary_domain_existent.zone_id}"
  name = "www.${var.domain_name}"
  type = "CNAME"
  ttl = "60"
  records = ["${var.domain_name}"]
}