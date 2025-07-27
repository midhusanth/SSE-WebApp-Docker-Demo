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

variable "location" {
  type = string
  default = "UK South"
}

variable "resource_group_name" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "docker_image_name" {
  type = string
}

variable "docker_image_tag" {
  default = "latest"
}

variable "docker_registry_url" {
  type = string
}

variable "docker_registry_username" {
  type = string
}

variable "docker_registry_password" {
  type = string
}