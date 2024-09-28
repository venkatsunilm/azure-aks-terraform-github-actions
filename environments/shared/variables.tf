variable "location" {
  description = "The location name"
  type        = string
}

variable "node_count" {
  description = "The number of AKS nodes"
  type        = number
}

variable "environment" {
  description = "The environment (development or production)"
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

