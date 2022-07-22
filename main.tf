module "network" {
  source       = "./network"
  name         = "network"
  rg           = "azurelab"
  location     = var.location
  cidr         = ["0.0.0.0/0"]
  subnet       = var.subnets
  storage_name = var.storage_name
}

module "storage" {
  source         = "./storage"
  prefix         = "blob"
}

