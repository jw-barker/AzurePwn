#variable "subscriptionId" {
#  description = "The Subscription ID for the account"
#  type        = string
#}
#
#variable "tenantId" {
#  description = "The tenant ID for the account"
#  type        = string
#}

variable "location" {
  default     = "uksouth"
  type        = string
  description = "The location for the resources"
}

variable "subnets" {
  type = list(object({
    name : string,
    subnet : list(string)
  }))
  default = [
    {
      name   = "subnet_one"
      subnet = ["0.0.0.0/0"]
      }, {
      name   = "server_two"
      subnet = ["0.0.0.0/0"]
      }, {
      name   = "subnet_three"
      subnet = ["0.0.0.0/0"]
    }
  ]
  description = "The subnets to use with the network"
}

variable "storage_name" {
  default     = "azurelab"
  description = ""
}