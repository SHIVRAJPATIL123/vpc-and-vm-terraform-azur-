variable "rg_name" {
  description = "rg_name"
}

variable "rg_location" {
    description = "rg_location"
}

variable "create_azurerm_resource_group" {
  type = bool
  default = false
}