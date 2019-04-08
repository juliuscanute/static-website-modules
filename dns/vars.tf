variable "domain" {
  description = "Name of the Domain"
  type = "string"
}

variable "alias_domain_name" {
  description = "Domain Name Alias"
  type = "string"
}

variable "alias_zone_id" {
  description = "Zone ID Alias"
  type = "string"
}

variable "alias_health_check" {
  description = "Health check alias"
  type = "string"
  default = "false"
}