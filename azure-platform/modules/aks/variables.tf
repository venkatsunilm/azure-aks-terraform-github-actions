variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "node_count" {
  description = "The number of AKS nodes"
  type        = number
  default     = 3
}

variable "environment" {
<<<<<<< HEAD
<<<<<<< HEAD
  description = "The environment (e.g., dev, prod)"
=======
  description = "The environment (e.g., development, production)"
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
  description = "The environment (e.g., dev, prod)"
>>>>>>> 6debb0f (Refactor: code cleanup and renaming (#32))
  type        = string
}

variable "location" {
  description = "The location/region where the AKS cluster will be deployed"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the Kubernetes cluster"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "acr_registry_id" {
  description = "The id of the Azure Container Registry"
  type        = string
}
