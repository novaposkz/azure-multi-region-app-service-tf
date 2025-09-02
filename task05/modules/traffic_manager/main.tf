resource "azurerm_traffic_manager_profile" "tm" {
  name                   = var.name
  resource_group_name    = var.resource_group
  traffic_routing_method = var.routing_method

  dns_config {
    relative_name = var.name
    ttl           = 60
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoints" {
  for_each = var.endpoints

  name               = each.key
  profile_id         = azurerm_traffic_manager_profile.tm.id
  target_resource_id = each.value.target_resource_id
  weight             = 100

  # Добавляем проверку, чтобы не создавать endpoint с пустым target
  lifecycle {
    ignore_changes = [target_resource_id]
    precondition {
      condition     = each.value.target_resource_id != ""
      error_message = "Target resource ID cannot be empty for endpoint ${each.key}"
    }
  }
}