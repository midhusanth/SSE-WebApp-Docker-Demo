variable "location" {
  type    = string
  default = "UK South"
}

variable "resource_group_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "Basic"
}

variable "admin_enabled" {
  type    = bool
  default = false
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
