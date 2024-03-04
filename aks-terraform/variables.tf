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
  type = string
  sensitive = true
}

variable "tenant_id" {
  description = "Azure tenant id"
  type = string
  sensitive = true
}
