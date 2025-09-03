resource_groups = {
  rg1 = {
    name     = "cmaz-f4p05tns-mod5-rg-01"
    location = "westeurope"
  },
  rg2 = {
    name     = "cmaz-f4p05tns-mod5-rg-02"
    location = "eastus"
  },
  rg3 = {
    name     = "cmaz-f4p05tns-mod5-rg-03"
    location = "centralus"
  }
}

app_service_plans = {
  asp1 = {
    name           = "cmaz-f4p05tns-mod5-asp-01"
    resource_group = "cmaz-f4p05tns-mod5-rg-01"
    location       = "westeurope"
    worker_count   = 2
    sku            = "P0v3"
  },
  asp2 = {
    name           = "cmaz-f4p05tns-mod5-asp-02"
    resource_group = "cmaz-f4p05tns-mod5-rg-02"
    location       = "eastus"
    worker_count   = 1
    sku            = "P1v3"
  }
}

app_services = {
  app1 = {
    name             = "cmaz-f4p05tns-mod5-app-01"
    resource_group   = "cmaz-f4p05tns-mod5-rg-01"
    location         = "westeurope"
    app_service_plan = "cmaz-f4p05tns-mod5-asp-01"
    ip_restrictions = [
      {
        name       = "allow-ip"
        ip_address = "18.153.146.156/32" # Добавляем /32
        priority   = 100
        action     = "Allow"
      },
      {
        name       = "allow-tm"
        ip_address = "AzureTrafficManager"
        priority   = 200
        action     = "Allow"
      }
    ]
  },
  app2 = {
    name             = "cmaz-f4p05tns-mod5-app-02"
    resource_group   = "cmaz-f4p05tns-mod5-rg-02"
    location         = "eastus"
    app_service_plan = "cmaz-f4p05tns-mod5-asp-02"
    ip_restrictions = [
      {
        name       = "allow-ip"
        ip_address = "18.153.146.156/32" # Добавляем /32
        priority   = 100
        action     = "Allow"
      },
      {
        name       = "allow-tm"
        ip_address = "AzureTrafficManager"
        priority   = 200
        action     = "Allow"
      }
    ]
  }
}

traffic_manager = {
  name           = "cmaz-f4p05tns-mod5-traf"
  resource_group = "cmaz-f4p05tns-mod5-rg-03"
  location       = "centralus"
  routing_method = "Performance"
  endpoints = {
    app1 = {
      target_resource_id = ""
    },
    app2 = {
      target_resource_id = ""
    }
  }
}

tags = {
  Creator = "tani_bekeshev@epam.com"
}