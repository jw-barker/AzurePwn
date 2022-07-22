resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.network_group.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
