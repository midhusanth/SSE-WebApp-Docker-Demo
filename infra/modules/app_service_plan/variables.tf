variable "name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "Azure region (e.g. East US)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "app_kind" {
  description = "App Service Plan kind"
  type        = string
}

variable "sku_tier" {
  description = "App Service Plan Sku Tier"
  type        = string
}

variable "sku_size" {
  description = "App Service Plan Sku Size"
  type        = string
}



