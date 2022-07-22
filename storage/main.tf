resource "azurerm_resource_group" "blob" {
  name     = "storage-resources"
  location = "Uk South"
}

resource "azurerm_storage_account" "storage" {
  name                     = "assets"
  resource_group_name      = azurerm_resource_group.blob.name
  location                 = azurerm_resource_group.blob.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "con" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "container"
}

resource "azurerm_storage_blob" "flag" {
  name                   = "assets"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.con.name
  type                   = "Block"
  source                 = "./flag.txt"
}

resource "null_resource" "uploadfile" {

  provisioner "local-exec" {

    command = <<-EOT
  }
  
  $storageAcct = Get-AzStorageAccount -ResourceGroupName "${azurerm_resource_group.blob.name}" -Name "${azurerm_storage_account.storage.name}"
       Set-AzStorageFileContent `
       -Context $storageAcct.Context `
       -ShareName "${azurerm_storage_container.con.name}" `
       -Source "./flag.txt" `
       -Path "flag.txt"

      EOT

    interpreter = ["PowerShell", "-Command"]
  }

}
