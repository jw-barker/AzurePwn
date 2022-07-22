variable "name" {
  description = "The name of the network begin built"
}

variable "rg" {
  description = "The name of the network begin built"
}

variable "location" {
  default     = "ukwest"
  description = "The location for the resources"
}

variable "cidr" {
  description = "The CIDR ranges for the network"
}

variable "storage_name" {
  description = "storage name"
}

variable "subnet" {
  description = "subnet ip range"
}
