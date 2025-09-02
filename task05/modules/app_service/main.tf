resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  service_plan_id     = var.app_service_plan_id

  site_config {
    always_on = false

    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name     = ip_restriction.value.name
        priority = ip_restriction.value.priority
        action   = ip_restriction.value.action

        # Используем правильный блок для service tag
        dynamic "service_tag" {
          for_each = ip_restriction.value.ip_address == "AzureTrafficManager" ? [1] : []
          content {
            name = "AzureTrafficManager"
          }
        }

        # Используем правильный блок для IP-адреса
        dynamic "ip_address" {
          for_each = ip_restriction.value.ip_address != "AzureTrafficManager" ? [ip_restriction.value.ip_address] : []
          content {
            ip_address = ip_address.value
          }
        }
      }
    }
  }

  tags = var.tags
}