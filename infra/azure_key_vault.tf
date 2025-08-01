data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "docker-demo" {
  name                        = "kv-${var.app_name}-${var.environment}"
  location                    = module.rg_webapp_docker_demo.resource_group_location
  resource_group_name         = module.rg_webapp_docker_demo.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}