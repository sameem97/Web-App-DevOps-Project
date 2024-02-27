variable "resource_group_name" {
    description = "Name of the resource group where the networking resources will be deployed"
    type = string
    default = "Networking"
}

variable "location" {
    description = "Azure region where the networking resources will be deployed"
    type = string
    default = "UK South"
}

variable "vnet_address_space" {
    description = "Address space for the Virtual Network (VNet)"
    type = list(string)
    default = ["10.0.0.0/16"]
}