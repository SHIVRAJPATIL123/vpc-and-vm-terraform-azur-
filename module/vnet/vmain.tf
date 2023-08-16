resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = var.add_space
  location            = var.vnet_location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "example" {
#   count                = var.create_subnet ? 1 : 0
  count = "${length(var.subnet_prefix)}"  
  name = "${lookup(element(var.subnet_prefix, count.index), "name")}"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes = ["${lookup(element(var.subnet_prefix, count.index), "ip")}"]

   dynamic "delegation" {
    for_each = length(var.delegation) > 0 ? [0] : []
    content {
      name = "delegation"

        service_delegation {
        name    = "Microsoft.ContainerInstance/containerGroups"
        actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
        }
    }
  }
}

resource "azurerm_network_interface" "example" {
  name                = var.network_interface_name
  location            = var.vnet_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  }
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vnet_name}-ip"
  location            = var.vnet_location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
}
resource "azurerm_network_security_group" "example" {
  name                = "${var.vnet_name}-SG"
  location            = var.vnet_location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}
  }


resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.example[0].id
  network_security_group_id = azurerm_network_security_group.example.id
}