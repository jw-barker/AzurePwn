locals {
  subnet_count = length(var.subnet)
}

resource "azurerm_resource_group" "network_group" {
  location = var.location
  name     = var.rg
}

resource "azurerm_virtual_network" "network" {
  name                = var.name
  location            = azurerm_resource_group.network_group.location
  address_space       = var.cidr
  resource_group_name = azurerm_resource_group.network_group.name
  dns_servers         = ["0.0.0.0"]
}

resource "azurerm_subnet" "subnets" {
  count                = local.subnet_count
  name                 = var.subnet[count.index].name
  resource_group_name  = azurerm_resource_group.network_group.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = var.subnet[count.index].subnet
}
