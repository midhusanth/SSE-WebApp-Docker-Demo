module "app_service_plan" {
  source = "./modules/app_service_plan"

  name                = var.asp_name
  location            = var.location
  resource_group_name = module.resourcegroup.resource_group_name
  app_kind            = var.asp_appkind
  sku_tier            = var.asp_sku_tier
  sku_size            = var.asp_sku_size
}


module "asp_docker_demo" {
  source = "./modules/app_service_plan_v2"

  app_name = var.app_name
  location = var.location
  env      = var.environment

  resource_group_name = module.rg_webapp_docker_demo.resource_group_name

  os_type  = var.asp_os_type
  sku_name = var.asp_sku_name
}
