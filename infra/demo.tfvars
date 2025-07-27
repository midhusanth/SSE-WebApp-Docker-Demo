## Common
location    = "uksouth"
environment = "demo"
app_name    = "docker-health"


## Azure Container Registry
acr_name          = "acrmidsanth1855"
acr_sku           = "Basic"
acr_admin_enabled = true

##App Service Plan
asp_name     = "asp-midsanth-dev-uks"
asp_appkind  = "Linux"
asp_sku_size = "B1"
asp_sku_tier = "Basic"

asp_os_type  = "Linux"
asp_sku_name = "B1"

##Webapp Container
webapp_name         = "appdockerhealth"
docker_registry_url = "https://acrmidsanth1855.azurecr.io"
docker_image_name   = "flask-health-app:v3"
