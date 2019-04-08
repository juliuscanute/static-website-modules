variable "aws_bucket_name" {
  description = "The name of the S3 bucket"
}

variable acl {
  description = "The access rights of the bucket"
  type = "string"
  default = "private"
}

variable "allowed_headers" {
  description = "The allowed HTTP headers"
  type = "list"
  default = ["*"]
}

variable "allowed_methods" {
  description = "The allowed HTTP methods"
  type = "list"
  default = ["GET"]
}

variable "allowed_origins" {
  description = "The domain name of the allowed origin"
  type = "list"
}