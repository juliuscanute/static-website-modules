variable domain_name {
  description = "Domain name of the server"
  type = "string"
}

variable "alternative_names" {
  description = "An example of a list in Terraform"
  type = "list"
}

variable "zone_id" {
  description = "Zone ID of the primary domain"
  type = "string"
}