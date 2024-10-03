# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }

  alias = "aks"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.3.0"
    }
  }
}


