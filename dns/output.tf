output zone_id_non_existent {
  value = "${aws_route53_zone.primary_domain_non_existent.zone_id}"
}

output zone_id_existent {
  value = "${data.aws_route53_zone.primary_domain_existent.zone_id}"
}