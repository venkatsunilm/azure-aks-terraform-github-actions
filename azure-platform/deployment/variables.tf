variable "location" {
  description = "The location name"
  type        = string
}

variable "node_count" {
  description = "The number of AKS nodes"
  type        = number
}

variable "environment" {
<<<<<<< HEAD
<<<<<<< HEAD
  description = "The environment (dev or prod)"
=======
  description = "The environment (development or production)"
>>>>>>> 2c252cb (Refactor: refactoring the project as per the planned design (#28))
=======
  description = "The environment (dev or prod)"
>>>>>>> 6debb0f (Refactor: code cleanup and renaming (#32))
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
