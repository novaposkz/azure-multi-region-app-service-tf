output "id" {
  description = "ID of the app service"
  value       = azurerm_windows_web_app.app.id
}

output "name" {
  description = "Name of the app service"
  value       = azurerm_windows_web_app.app.name
}

output "default_hostname" {
  description = "Default hostname of the app service"
  value       = azurerm_windows_web_app.app.default_hostname
}

output "outbound_ip_addresses" {
  description = "Outbound IP addresses of the app service"
  value       = azurerm_windows_web_app.app.outbound_ip_addresses
}