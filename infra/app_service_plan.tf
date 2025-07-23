module "app_service_plan" {
  source              = "./modules/app_service_plan"
  name                = var.asp_name
  location            = var.location
  resource_group_name = module.resourcegroup.resource_group_name
  app_kind            = var.asp_appkind
  sku_tier            = var.asp_sku_tier
  sku_size            = var.asp_sku_size
}
