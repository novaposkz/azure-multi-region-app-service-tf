output "id" {
  description = "ID of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.tm.id
}

output "fqdn" {
  description = "FQDN of the traffic manager profile"
  value       = azurerm_traffic_manager_profile.tm.fqdn
}

output "traffic_routing_method" {
  description = "Traffic routing method"
  value       = azurerm_traffic_manager_profile.tm.traffic_routing_method
}