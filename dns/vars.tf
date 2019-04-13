variable "domain_name" {
  description = "Name of the Domain"
  type = "string"
}

variable "alias_domain_name" {
  description = "Domain Name Alias"
  type = "string"
  default = ""
}

variable "alias_zone_id" {
  description = "Zone ID Alias"
  type = "string"
  default = ""
}

variable "alias_health_check" {
  description = "Health check alias"
  type = "string"
  default = "false"
}

variable "existing" {
  description = "Existing Record"
  type = "string"
  default = "false"
}

variable "create_record" {
  description = "Existing Record"
  type = "string"
  default = "false"
}