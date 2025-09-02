variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "Map of app service plans to create"
  type = map(object({
    name           = string
    resource_group = string
    location       = string
    worker_count   = number
    sku            = string
  }))
}

variable "app_services" {
  description = "Map of app services to create"
  type = map(object({
    name             = string
    resource_group   = string
    location         = string
    app_service_plan = string
    ip_restrictions = list(object({
      name       = string
      ip_address = string
      priority   = number
      action     = string
    }))
  }))
}

variable "traffic_manager" {
  description = "Traffic manager configuration"
  type = object({
    name           = string
    resource_group = string
    location       = string
    routing_method = string
    endpoints = map(object({
      target_resource_id = string
    }))
  })
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Creator = "tani_bekeshev@epam.com"
  }
}