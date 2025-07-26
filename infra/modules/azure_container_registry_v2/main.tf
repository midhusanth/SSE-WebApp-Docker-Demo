locals {
    region_mappings = {
      "uksouth" : "uks",
      "ukwest" : "ukw",
      "northeurope" : "eun",
      "westeurope" : "euw"
    }
    naming_convention_region = try(local.region_mappings[lower(var.location)], "glb")
    acr_name      = lower("acr${var.app_name}${var.env}${local.naming_convention_region}")
}

resource "azurerm_container_registry" "acr" {
  name                = local.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}
