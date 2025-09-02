variable "name" {
  description = "Name of the traffic manager profile"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the traffic manager profile"
  type        = string
}

variable "routing_method" {
  description = "Traffic routing method"
  type        = string
}

variable "endpoints" {
  description = "Map of endpoints for traffic manager"
  type = map(object({
    target_resource_id = string
  }))
  default = {}
}

variable "tags" {
  description = "Tags to apply to the traffic manager profile"
  type        = map(string)
}