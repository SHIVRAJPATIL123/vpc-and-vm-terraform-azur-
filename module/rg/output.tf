output "rg_name" {
  value = try(azurerm_resource_group.example[0].name,"")
}

output "rg_location" {
  value = try(azurerm_resource_group.example[0].location,"")
}

output "rg_id" {
  value = try(azurerm_resource_group.example[0].id,"")
}