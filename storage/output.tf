output "bucket_arn" {
  value = "${aws_s3_bucket.data_storage_bucket.arn}"
}

output "bucket_id" {
  value = "${aws_s3_bucket.data_storage_bucket.id}"
}

output "bucket_domain_name" {
  value = "${aws_s3_bucket.data_storage_bucket.bucket_domain_name}"
}