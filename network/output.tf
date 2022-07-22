output "network_id" {
  value = azurerm_virtual_network.network.id
}

output "network_name" {
  value = azurerm_virtual_network.network.name
}

output "resource_group" {
  value = azurerm_resource_group.network_group.name
}

output "storage_name" {
  value = azurerm_storage_account.storage.name
}