module "rg_webapp_docker_demo" {
  source  = "app.terraform.io/MG-WepApp-Docker-Demo/resourcegroup/azurerm"
  version = "1.2.0"

  app_name = var.app_name
  location = var.location
  env      = var.environment
}


