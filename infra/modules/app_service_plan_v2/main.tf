locals {
  region_mappings = {
    "uksouth" : "uks",
    "ukwest" : "ukw",
    "northeurope" : "eun",
    "westeurope" : "euw"
  }
  naming_convention_region = try(local.region_mappings[lower(var.location)], "glb")
  asp_name                 = trimsuffix(lower("asp-${var.app_name}-${var.env}-${local.naming_convention_region}"), "-")
}


resource "azurerm_service_plan" "asp" {
  name                = local.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type  = var.os_type
  sku_name = var.sku_name
}
