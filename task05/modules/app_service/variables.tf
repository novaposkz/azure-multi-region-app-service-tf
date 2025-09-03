variable "name" {
  description = "Name of the app service"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the app service"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID of the app service plan"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the app service"
  type        = map(string)
}

variable "ip_restrictions" {
  description = "IP restriction rules"
  type = list(object({
    name       = string
    ip_address = string
    priority   = number
    action     = string
  }))
}