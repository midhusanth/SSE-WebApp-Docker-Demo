variable "location" {
  description = "Azure region (e.g. East US)"
  type        = string
}

variable "app_name" {
  description = "Application Name"
  type        = string
}

variable "env" {
  type        = string
  description = "The environment the resource will be deployed into."
  validation {
    condition     = contains(["demo", "dev", "test", "prd"], var.env)
    error_message = "Invalid env variable value passed. Accepted values are demo, dev, test, prd."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sku_name" {
  description = "App Service Plan Sku Tier"
  type        = string
}

variable "os_type" {
  description = "App Service Plan OS Type"
  type        = string
}



