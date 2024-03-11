# Usage instructions for this Azure Networking Terraform Module

This module sets up the necessary Azure networking infrastructure for the deployment of an AKS cluster as defined in a separate module. As a result, it is a prerequisite before proceeding with deploying the cluster.

## Prerequisites

- Ensure you have Terraform installed.
- Ensure you have your Azure service principal credentials. You will need this for authentication with the azure resource manager.

## Usage

1. **Define environment variables** in your shell start up file. As a minimum this will include sensitive information such as your service principal credentials, vnet, subnets and source address prefix. As a rule of thumb, any input variables as defined in the module variables.tf file that do not have a default value will need an environment variable configured. The exception to this is if the values are provided from the outputs of a different module, as is the case with the aks cluster module referencing outputs from this module.

2. **Initialise the child networking module**. Ensure you are in the module directory.

3. **Create a `main.tf` file in the root module**. The root module is your Terraform project directory which will call the child module.

```hcl
# main.tf

# Import the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.94.0"
    }
  }
}

# Configure the Azure Provider with your service principal credentials
provider "azurerm" {
  features {}  # Optional: Enable specific features
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

# Call the networking module (child directory).
module "networking" {
    source = "./networking-module-path"

    # Input variables for the networking module
    vnet_address_space    = var.vnet_address_space
    cp_subnet_space       = var.cp_subnet_space
    wn_subnet_space       = var.wn_subnet_space
    source_address_prefix = var.source_address_prefix
}
