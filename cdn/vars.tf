variable "domain_name" {
  description = "Name of the Domain"
  type = "string"
}

variable "allowed_methods" {
  description = "The allowed HTTP methods"
  type = "list"
  default = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "The cached HTTP methods"
  type = "list"
  default = ["GET", "HEAD"]
}

variable "valid_aliases" {
  description = "The valid aliases"
  type = "list"
}

variable "certificate_arn" {
  description = "ARN of valid certificate to use"
  type = "string"
}