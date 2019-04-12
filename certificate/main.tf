data "aws_route53_zone" "primary_domain_existent" {
  name = "${var.domain_name}"
}

resource "aws_acm_certificate" "aws_website_certificate" {
  domain_name = "${var.domain_name}"
  subject_alternative_names = "${var.alternative_names}"
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "dns_validation" {
  certificate_arn = "${aws_acm_certificate.aws_website_certificate.arn}"
  validation_record_fqdns = [
    "${aws_route53_record.cert_validation.fqdn}",
    "${aws_route53_record.cert_validation_alt1.fqdn}"]
}

resource "aws_route53_record" "cert_validation" {
  name = "${aws_acm_certificate.aws_website_certificate.domain_validation_options.0.resource_record_name}"
  type = "${aws_acm_certificate.aws_website_certificate.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.primary_domain_existent.zone_id}"
  records = [
    "${aws_acm_certificate.aws_website_certificate.domain_validation_options.0.resource_record_value}"]
  ttl = 60
}

resource "aws_route53_record" "cert_validation_alt1" {
  name = "${aws_acm_certificate.aws_website_certificate.domain_validation_options.1.resource_record_name}"
  type = "${aws_acm_certificate.aws_website_certificate.domain_validation_options.1.resource_record_type}"
  zone_id = "${data.aws_route53_zone.primary_domain_existent.zone_id}"
  records = [
    "${aws_acm_certificate.aws_website_certificate.domain_validation_options.1.resource_record_value}"]
  ttl = 60
}