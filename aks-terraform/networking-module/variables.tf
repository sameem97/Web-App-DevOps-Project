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
    sensitive = true
}

variable "cp_subnet_space" {
    description = "Address space for control plane nodes"
    type = list(string)
    sensitive = true
}

variable "wn_subnet_space" {
    description = "Address space for worker nodes"
    type = list(string)
    sensitive = true
}

variable "source_address_prefix" {
    description = "Source prefix for network security rule"
    type = string
    sensitive = true
}