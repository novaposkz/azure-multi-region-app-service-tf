output "id" {
  description = "ID of the app service plan"
  value       = azurerm_service_plan.asp.id
}

output "name" {
  description = "Name of the app service plan"
  value       = azurerm_service_plan.asp.name
}