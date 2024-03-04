variable "aks_cluster_name" {
  description = "Name you want to give to the aks cluster"
  type = string
  default = "my-aks-cluster"
}

variable "cluster_location" {
  description = "Azure region for the cluster"
  type = string
  default = "UK South"
}

variable "dns_prefix" {
  description = "dns prefix for the cluster"
  type = string
}

variable "kubernetes_version" {
  description = "kubernetes version you want to use"
  type = string
}

variable "client_id" {
  description = "sp app id"
  type = string
  sensitive = true
}

variable "client_secret" {
  description = "sp app password"
  type = string
  sensitive = true
}

# Input variables from the networking module
variable "resource_group_name" {
}

variable "vnet_id" {
}

variable "control_plane_subnet_id" {
}

variable "worker_node_subnet_id" {
}

variable "aks_nsg_id" {
}
