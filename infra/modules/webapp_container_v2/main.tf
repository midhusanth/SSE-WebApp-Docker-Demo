locals {
  region_mappings = {
    "uksouth" : "uks",
    "ukwest" : "ukw",
    "northeurope" : "eun",
    "westeurope" : "euw"
  }
  naming_convention_region = try(local.region_mappings[lower(var.location)], "glb")
  webapp_name                 = (lower("app${var.app_name}${var.env}${local.naming_convention_region}"))
}


resource "azurerm_linux_web_app" "webapp" {
  name                = local.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = var.docker_registry_url 
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password   
    }

    always_on = false
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }

  identity {
    type = "SystemAssigned"
  }
}