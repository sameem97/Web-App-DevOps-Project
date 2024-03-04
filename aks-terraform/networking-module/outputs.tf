output "vnet_id" {
  description = "ID of the Virtual Network (VNet)."
  value       = azurerm_virtual_network.vnet.id
}

output "control_plane_subnet_id" {
  description = "ID of the control plane subnet."
  value       = azurerm_subnet.cp_subnet.id
}

output "worker_node_subnet_id" {
  description = "ID of the worker node subnet."
  value       = azurerm_subnet.wn_subnet.id
}

output "networking_resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  value       = azurerm_resource_group.networking.name
}

output "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  value       = azurerm_network_security_group.nsg.id
}
