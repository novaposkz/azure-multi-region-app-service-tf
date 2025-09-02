# Create Resource Groups
module "resource_groups" {
  for_each = var.resource_groups
  source   = "./modules/resource_group"

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

# Create App Service Plans
module "app_service_plans" {
  for_each = var.app_service_plans
  source   = "./modules/app_service_plan"

  name           = each.value.name
  resource_group = each.value.resource_group
  location       = each.value.location
  worker_count   = each.value.worker_count
  sku            = each.value.sku
  tags           = var.tags

  depends_on = [module.resource_groups]
}

# Create App Services
module "app_services" {
  for_each = var.app_services
  source   = "./modules/app_service"

  name                = each.value.name
  resource_group      = each.value.resource_group
  location            = each.value.location
  app_service_plan_id = module.app_service_plans[each.value.app_service_plan == "cmaz-f4p05tns-mod5-asp-01" ? "asp1" : "asp2"].id
  ip_restrictions     = each.value.ip_restrictions
  tags                = var.tags

  depends_on = [module.app_service_plans]
}

# Update traffic manager endpoints with actual app service IDs
locals {
  updated_traffic_manager = {
    name           = var.traffic_manager.name
    resource_group = var.traffic_manager.resource_group
    location       = var.traffic_manager.location
    routing_method = var.traffic_manager.routing_method
    endpoints = {
      app1 = {
        target_resource_id = module.app_services["app1"].id
      },
      app2 = {
        target_resource_id = module.app_services["app2"].id
      }
    }
  }
}

# Create Traffic Manager
module "traffic_manager" {
  source = "./modules/traffic_manager"

  name           = local.updated_traffic_manager.name
  resource_group = local.updated_traffic_manager.resource_group
  location       = local.updated_traffic_manager.location
  routing_method = local.updated_traffic_manager.routing_method
  endpoints      = local.updated_traffic_manager.endpoints
  tags           = var.tags

  depends_on = [module.app_services, module.resource_groups]
}