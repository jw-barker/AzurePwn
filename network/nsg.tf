resource "azurerm_network_security_group" "default" {
  name                = "default-nsg"
  location            = azurerm_resource_group.network_group.location
  resource_group_name = azurerm_resource_group.network_group.name

  security_rule {
    name                       = "Block - Intra Subnet"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.0.0/16"
  }

  security_rule {
    name                       = "Allow - Internet UDP"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow - Internet TCP"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
