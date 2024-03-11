# Usage instructions for this Azure AKS Terraform Root Module

This root module is the main project directory and contains two child modules: one networking module and one aks-cluster module. The child modules are called in the main configuration file and the relevant infrastructure is deployed i.e. a working Azure AKS Cluster with the networking infrastructure as specified.

## Prerequisites

- Ensure you have Terraform installed.
- Ensure you have initialised both child modules. Refer to the module USAGE.MD for instruction and ensure you follow the prerequisites and configuration of relevant environment variables.

## Usage

1. **Within the `main.tf` file in the root module** you should have imported and configured the azure provider, and called the networking module and aks cluster module. This is your finalised main configuration.

2. **Define required input variables** in your variables.tf file.

3. **Initialise the root module**. Ensure you are in the module directory. You are now ready to continue with the rest of your terraform workflow (i.e. plan, apply, destroy).
