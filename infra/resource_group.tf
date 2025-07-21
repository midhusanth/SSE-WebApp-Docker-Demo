module "resourcegroup" {
  source  = "app.terraform.io/MG-WepApp-Docker-Demo/resourcegroup/azurerm"
  version = "1.0.1"

  resource_group_name = var.resource_group_name
  location            = var.location

}

module "resourcegroup2" {
  source  = "app.terraform.io/MG-WepApp-Docker-Demo/resourcegroup/azurerm"
  version = "1.0.1"

  resource_group_name = var.resource_group_name2
  location            = var.location

}

