terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "networking" {
  source = "./networking-module"

  # Input variables for the networking module
  vnet_address_space    = var.vnet_address_space
  cp_subnet_space       = var.cp_subnet_space
  wn_subnet_space       = var.wn_subnet_space
  source_address_prefix = var.source_address_prefix
}

module "aks_cluster" {
  source = "./aks-cluster-module"

  # Input variables for the AKS cluster module
  dns_prefix         = "myaks-project"
  kubernetes_version = "1.26.6"
  client_id          = var.client_id
  client_secret      = var.client_secret

  # Input variables referencing outputs from the networking module
  resource_group_name     = module.networking.networking_resource_group_name
  vnet_id                 = module.networking.vnet_id
  control_plane_subnet_id = module.networking.control_plane_subnet_id
  worker_node_subnet_id   = module.networking.worker_node_subnet_id
  aks_nsg_id              = module.networking.aks_nsg_id

  depends_on = [module.networking]
}