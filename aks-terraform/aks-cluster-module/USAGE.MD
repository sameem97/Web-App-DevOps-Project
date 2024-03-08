# Usage instructions for this Azure AKS Cluster Terraform Module

This module sets up an Azure AKS cluster. It uses outputs from the adjacent networking module to specify the required networking infrastructure.

## Prerequisites

- Ensure you have Terraform installed.
- Ensure you have initialised the adjacent networking module as this module depends on it for the networking infrastructure. Refer to the module USAGE.MD for instruction and ensure you follow the prerequisites and configuration of relevant environment variables.

## Usage

1. **Initialise the child aks cluster module**. Ensure you are in the module directory.

2. **Within the `main.tf` file in the root module** you should have already imported and configured the azure provider, and called the networking module. In addition, you also need to add a block to call the aks cluster module (see below). This will finalise your main terraform project configuration. After this, you will need to initialise the root module and you should be ready to continue with the rest of your terraform workflow (i.e. plan, apply, destroy).

```hcl
# main.tf

# Call the aks cluster module (child directory).
module "aks_cluster" {
  source = "./aks-cluster-module-path"

  # Input variables for the AKS cluster module
  dns_prefix         = "aks-project"
  kubernetes_version = "1.29.0"
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