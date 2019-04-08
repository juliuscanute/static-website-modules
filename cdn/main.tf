locals {
  s3_origin_id = "s3_website_origin"
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "S3 bucket access identity"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${var.domain_name}"
    origin_id = "${local.s3_origin_id}"
    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  enabled = true
  is_ipv6_enabled = true
  comment = "CloudFront Distribution"
  default_root_object = "index.html"

  aliases = "${var.valid_aliases}"

  default_cache_behavior {
    allowed_methods = "${var.allowed_methods}"
    cached_methods = "${var.cached_methods}"
    target_origin_id = "${local.s3_origin_id}"
    compress = true
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }

  viewer_certificate {
    acm_certificate_arn = "${var.certificate_arn}"
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "production"
  }
}