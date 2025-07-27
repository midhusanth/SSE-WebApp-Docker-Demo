module "resourcegroup" {
  source  = "app.terraform.io/MG-WepApp-Docker-Demo/resourcegroup/azurerm"
  version = "1.0.1"

  resource_group_name = var.resource_group_name
  location            = var.location

}

module "rg_webapp_docker_demo" {
  source  = "app.terraform.io/MG-WepApp-Docker-Demo/resourcegroup/azurerm"
  version = "1.2.0"

  app_name = var.app_name
  location = var.location
  env      = var.environment
}


