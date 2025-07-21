## Resource Group
resource_group_name = "rg-webapp-docker-demo"
location            = "UK South"

## Azure Container Registry
acr_name = "acrmidsanth1855"
acr_sku = "Basic"
acr_admin_enabled = true

##App Service Plan
asp_name = "asp-midsanth-dev-uks"
asp_appkind = "Linux"
asp_sku_size = "F1"
asp_sku_tier = "Free"