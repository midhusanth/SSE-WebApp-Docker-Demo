resource "azurerm_app_service_plan" "asp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.app_kind

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }

  per_site_scaling = false
  reserved         = false
}
