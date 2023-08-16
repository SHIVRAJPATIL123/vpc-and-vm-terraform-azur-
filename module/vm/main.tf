
resource "azurerm_linux_virtual_machine" "example" {
  name                = var.virtual_machine_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = var.virtual_machine_size
  admin_username      = var.username
  network_interface_ids = var.network_interface_ids
  disable_password_authentication = false
  admin_password      = "pass@123"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}



