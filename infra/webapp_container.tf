module "webapp" {
  source = "./modules/webapp_container"

  webapp_name         = var.webapp_name
  location            = var.location
  resource_group_name = module.resourcegroup.resource_group_name
  service_plan_id     = module.app_service_plan.app_service_plan_id

  docker_image_name        = var.docker_image_name
  docker_registry_url      = var.docker_registry_url
  docker_registry_username = module.acr_webapp_demo.admin_username
  docker_registry_password = module.acr_webapp_demo.admin_password
}
