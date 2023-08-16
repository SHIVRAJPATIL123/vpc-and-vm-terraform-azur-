output "subnet_id" {
  value = azurerm_subnet.example[0].id
}
output "network_interface_id" {
  value = azurerm_network_interface.example.id
}
