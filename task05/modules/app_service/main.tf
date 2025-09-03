resource "azurerm_windows_web_app" "app" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  service_plan_id     = var.app_service_plan_id

  site_config {
    always_on = false

    # IP restrictions configuration
    ip_restriction {
      name       = "allow-ip"
      priority   = 100
      action     = "Allow"
      ip_address = "18.153.146.156/32"
    }

    ip_restriction {
      name        = "allow-tm"
      priority    = 200
      action      = "Allow"
      service_tag = "AzureTrafficManager"
    }
  }

  tags = var.tags
}