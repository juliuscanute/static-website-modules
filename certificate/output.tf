output "certificate_arn" {
  value = "${aws_acm_certificate.aws_website_certificate.arn}"
}