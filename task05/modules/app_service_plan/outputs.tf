output "id" {
  description = "ID of the app service plan"
  value       = azurerm_service_plan.asp.id
}

output "name" {
  description = "Name of the app service plan"
  value       = azurerm_service_plan.asp.name
}

output "worker_count" {
  description = "Worker count of the app service plan"
  value       = azurerm_service_plan.asp.worker_count
}

output "sku_name" {
  description = "SKU name of the app service plan"
  value       = azurerm_service_plan.asp.sku_name
}