variable "webapp_name" {
  type = string
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