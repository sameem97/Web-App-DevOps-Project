# Usage instructions for this Azure Networking Terraform Module

## Prerequisites

- Ensure you have Terraform installed.
- Ensure you have your Azure service principal credentials. You will need this for authentication with the azure resource manager.

## Usage

1. **Define environment variables** in your shell start up file. As a minimum this will include sensitive information such as your service principal credentials or public IPs, but also any other variables as defined in the module variables.tf file that do not have a default value.

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
}

# Call the networking module (child directory). Add input variables as required.
module "networking" {
    source = "./networking-module-path"
}
