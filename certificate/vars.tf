variable domain_name {
  description = "Domain name of the server"
  type = "string"
}

variable zone_id {
  description = "Zone ID of the server"
  type = "string"
}

variable "alternative_names" {
  description = "Alternative names for the domain"
  type = "list"
}