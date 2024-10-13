# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }

  alias = "aks"
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.15.0"
    }
  }
}


