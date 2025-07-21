variable "acr_name" {
  type = string
}

variable "location" {
  type = string
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
