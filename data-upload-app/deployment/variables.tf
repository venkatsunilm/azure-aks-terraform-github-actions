<<<<<<< HEAD
variable "location" {
  description = "The location name"
  type        = string
}

variable "environment" {
  description = "The environment (dev or prod)"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
=======
variable "environment" {
  description = "environment name"
  type        = string
  # default     = "dev"
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
