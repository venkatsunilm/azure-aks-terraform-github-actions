# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

provider "helm" {
  kubernetes {
    # TODO: How to set this dynamically
    # config_path = "/home/runner/.kube/config"
    # config_path = "/mnt/c/Users/harit/.kube/config"

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


