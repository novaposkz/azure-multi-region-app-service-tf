variable "name" {
  description = "Name of the app service plan"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the app service plan"
  type        = string
}

variable "sku" {
  description = "SKU for the app service plan"
  type        = string
}

variable "worker_count" {
  description = "Number of workers"
  type        = number
}

variable "tags" {
  description = "Tags to apply to the app service plan"
  type        = map(string)
}