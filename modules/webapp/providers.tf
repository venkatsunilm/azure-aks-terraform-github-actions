# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

# TODO: Remove azurerm provider as the root is already setting the provider. 
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    # config_path = "/mnt/c/Users/harit/.kube/config"
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
      version = "~> 2.15.0"
    }
  }
}


