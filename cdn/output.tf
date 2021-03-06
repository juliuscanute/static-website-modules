output "cloudfront_domain_name" {
  value = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
}

output "cloudfront_hosted_zone_id" {
  value = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
}

output "origin_iam_arn" {
  value = "${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"
}