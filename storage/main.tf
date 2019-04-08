resource "aws_s3_bucket" "data_storage_bucket" {
  bucket = "${var.aws_bucket_name}"
  acl = "${var.acl}"

  cors_rule {
    allowed_headers = "${var.allowed_headers}"
    allowed_methods = "${var.allowed_methods}"
    allowed_origins = "${var.allowed_origins}"
  }
  tags {
    Name = "Datastorage Bucket"
  }
}