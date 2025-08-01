module "acr_docker_demo" {
  source = "./modules/azure_container_registry_v2"

  app_name            = replace(var.app_name, "-", "")
  location            = var.location
  env                 = var.environment
  resource_group_name = module.rg_webapp_docker_demo.resource_group_name
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled

  depends_on = [module.rg_webapp_docker_demo]
}
