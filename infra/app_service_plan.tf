module "asp_docker_demo" {
  source = "./modules/app_service_plan_v2"

  app_name = var.app_name
  location = var.location
  env      = var.environment

  resource_group_name = module.rg_webapp_docker_demo.resource_group_name

  os_type  = var.asp_os_type
  sku_name = var.asp_sku_name

  depends_on = [module.rg_webapp_docker_demo]
}
