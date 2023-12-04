resource "azurerm_resource_group" "example" {
  count    = var.create_azurerm_resource_group ? 1 : 0
  name     = var.rg_name
  location = var.rg_location
}


# data "azurerm_resource_group" "example" {
#   name = var.rg_name
# }
   ######this  