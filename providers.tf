terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.10"
    }
  }

  #  backend "azurerm" {
  #    resource_group_name  = "terraform"
  #    storage_account_name = "punksecuritytfstate"
  #    container_name       = "tfstate"
  #    key                  = ".tfstate"
  #  }
}

provider "azurerm" {
  features {}
  #  subscription_id = var.subscriptionId
  #  tenant_id       = var.tenantId
}