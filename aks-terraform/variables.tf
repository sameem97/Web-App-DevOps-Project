variable "client_id" {
  description = "Access key for the provider"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Secret key for the provider"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure subscription id"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure tenant id"
  type        = string
  sensitive   = true
}

# Input variables defined for networking child module

variable "vnet_address_space" {
  description = "Address space for the Virtual Network (VNet)"
  type        = list(string)
  sensitive   = true
}

variable "cp_subnet_space" {
  description = "Address space for control plane nodes"
  type        = list(string)
  sensitive   = true
}

variable "wn_subnet_space" {
  description = "Address space for worker nodes"
  type        = list(string)
  sensitive   = true
}

variable "source_address_prefix" {
  description = "Source prefix for network security rule"
  type        = string
  sensitive   = true
}