module "webapp_docker_demo" {
  source = "./modules/webapp_container_v2"

  app_name            = var.app_name
  location            = var.location
  env                 = var.environment
  resource_group_name = module.rg_webapp_docker_demo.resource_group_name
  service_plan_id     = module.asp_docker_demo.app_service_plan_id

  docker_image_name        = var.docker_image_name
  docker_registry_url      = module.acr_docker_demo.docker_registry_url
  docker_registry_username = module.acr_docker_demo.admin_username
  docker_registry_password = module.acr_docker_demo.admin_password

  depends_on = [module.rg_webapp_docker_demo, module.asp_docker_demo]
}
