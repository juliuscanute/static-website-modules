output zone_id {
  value = ["${data.aws_route53_zone.primary_domain_existent.*.zone_id}","${aws_route53_zone.primary_domain_non_existent.*.zone_id}"]
}