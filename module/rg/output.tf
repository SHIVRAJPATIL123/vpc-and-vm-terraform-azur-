output "rg_name" {
  value = data.azurerm_resource_group.example.name
}

output "rg_location" {
  value = data.azurerm_resource_group.example.location
}

output "rg_id" {
  value = data.azurerm_resource_group.example.id
}