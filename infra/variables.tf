## Resource Group Variables
variable "resource_group_name" {
  type = string
}

##Common
variable "location" {
  type    = string
  default = "UK South"
}

variable "environment" {
  type = string
}

variable "app_name" {
  type = string
}

## Azure Container Registry Variables
variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type = string
}

variable "acr_admin_enabled" {
  type = string
}

##App Service Plan Variables
variable "asp_name" {
  type = string
}

variable "asp_appkind" {
  type = string
}

variable "asp_sku_name" {
  type = string
}

variable "asp_os_type" {
  type = string
}

variable "asp_sku_tier" {
  type = string
}

variable "asp_sku_size" {
  type = string
}

##WebApp Variables
variable "webapp_name" {
  type = string
}

variable "docker_image_name" {
  type = string
}

variable "docker_registry_url" {
  type = string
}

