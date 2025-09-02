resource "azurerm_service_plan" "asp" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  os_type             = "Windows"
  sku_name            = var.sku
  worker_count        = var.worker_count
  tags                = var.tags
}