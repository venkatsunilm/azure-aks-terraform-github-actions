variable "registry_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the AKS cluster will be deployed"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))
variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}

<<<<<<< HEAD
=======
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
>>>>>>> 63b6df2 (Feat: Separate pipelines for infrastructure and app deployments (#33))


