# Create the Azure Resource Group for networking resources
resource "azurerm_resource_group" "networking" {
  name = var.resource_group_name
  location = var.location
}

# Define the Virtual Network (VNet) for the AKS cluster
resource "azurerm_virtual_network" "vnet" {
  name = "aks-vnet"
  address_space = var.vnet_address_space
  location = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
}

# Define subnets within the VNet for control plane and worker nodes
resource "azurerm_subnet" "cp_subnet" {
  name = "control-plane-subnet"
  resource_group_name = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.cp_subnet_space
}

resource "azurerm_subnet" "wn_subnet" {
  name = "worker-node-subnet"
  resource_group_name = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.wn_subnet_space
}

# Define NSG for the AKS subnet
resource "azurerm_network_security_group" "nsg" {
  name = "aks-nsg"
  location = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
}

# Allow inbound traffic to kube-apiserver (TCP/443) from your public IP address
resource "azurerm_network_security_rule" "https" {
  name = "allow-https"
  priority = 1001
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = "443"
  source_address_prefix = var.source_address_prefix
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

# Allow inbound traffic for SSH (TCP/22)
resource "azurerm_network_security_rule" "ssh" {
  name                        = "allow-ssh"
  priority                    = 1002
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.networking.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
