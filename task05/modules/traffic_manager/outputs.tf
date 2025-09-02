output "id" {
  description = "ID of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.tm.id
}

output "fqdn" {
  description = "FQDN of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.tm.fqdn
}